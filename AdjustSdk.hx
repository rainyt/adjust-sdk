package;

import haxe.macro.Compiler;
import lime.system.CFFI;
import lime.system.JNI;

/**
 * AdjustSDK支持
 */
#if ios
@:buildXml("<include name='${haxelib:adjust-sdk}/project/adjust-sdk-ios/Build.xml' />")
@:headerInclude('adjustsdk.hpp')
#end
class AdjustSdk {
	#if vscode
	public static function main():Void {}
	#end

	#if android
	private static var adjustsdk_trackEvent = JNI.createStaticMethod("org.haxe.extension.AdjustSdk", "trackEvent", "(Ljava/lang/String;)V");

	private static var adjustsdk_trackRevenue = JNI.createStaticMethod("org.haxe.extension.AdjustSdk", "trackEvent",
		"(Ljava/lang/String;ILjava/lang/String;)V");
	#end

	public static function init():Void {
		#if ios
		var token = Compiler.getDefine("adjust_app_token");
		trace("开始初始化adjustsdk:", token);
		var debug = #if adjust_sandbox true #else false #end;
		initByToken(token, debug);
		#end
	}

	/**
	 * 要使用 Adjust SDK 发送事件信息，请实例化一个 AdjustEvent 对象。该对象中包含的变量会在应用中发生事件时被发送给 Adjust。
	 * 要实例化事件对象，请创建新的 AdjustEvent 实例，并传送下列参数：
	 * @param key 您的 Adjust 事件识别码
	 */
	public static function trackEvent(key:String):Void {
		if (key == "" || key == null)
			return;
		#if android
		adjustsdk_trackEvent(key);
		#end
	}

	/**
	 * 您可以通过在实例上设定 revenue (收入) 和 currency (币种) 属性来记录与事件关联的收入。使用此功能来在应用内记录产生收入的行为。
	 * @param key 事件key
	 * @param revenue 事件收入额，单位为分
	 * @param currency 事件币种
	 */
	public static function trackRevenue(key:String, revenue:Int, currency:String):Void {
		if (key == "" || key == null)
			return;
		#if android
		adjustsdk_trackRevenue(key, revenue, currency);
		#end
	}

	#if ios
	@:native("initByToken")
	extern public static function initByToken(token:cpp.ConstCharStar, debug:Bool):Void;
	#end
}
