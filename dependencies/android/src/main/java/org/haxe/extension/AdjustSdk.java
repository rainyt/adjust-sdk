package org.haxe.extension;


import android.content.Intent;
import android.os.Bundle;

import com.adjust.sdk.Adjust;
import com.adjust.sdk.AdjustConfig;
import com.adjust.sdk.AdjustEvent;
import com.adjust.sdk.LogLevel;

import zygame.ZSDK;


/* 
	You can use the Android Extension class in order to hook
	into the Android activity lifecycle. This is not required
	for standard Java code, this is designed for when you need
	deeper integration.
	
	You can access additional references from the Extension class,
	depending on your needs:
	
	- Extension.assetManager (android.content.res.AssetManager)
	- Extension.callbackHandler (android.os.Handler)
	- Extension.mainActivity (android.app.Activity)
	- Extension.mainContext (android.content.Context)
	- Extension.mainView (android.view.View)
	
	You can also make references to static or instance methods
	and properties on Java classes. These classes can be included 
	as single files using <java path="to/File.java" /> within your
	project, or use the full Android Library Project format (such
	as this example) in order to include your own AndroidManifest
	data, additional dependencies, etc.
	
	These are also optional, though this example shows a static
	function for performing a single task, like returning a value
	back to Haxe from Java.
*/
public class AdjustSdk extends Extension {

	/**
	 * 要使用 Adjust SDK 发送事件信息，请实例化一个 AdjustEvent 对象。该对象中包含的变量会在应用中发生事件时被发送给 Adjust。
	 * 要实例化事件对象，请创建新的 AdjustEvent 实例，并传送下列参数：
	 * @param key 您的 Adjust 事件识别码
	 */
	public static void trackEvent(String key){
		AdjustEvent adjustEvent = new AdjustEvent(key);
		Adjust.trackEvent(adjustEvent);
	}

	/**
	 * 您可以通过在实例上设定 revenue (收入) 和 currency (币种) 属性来记录与事件关联的收入。使用此功能来在应用内记录产生收入的行为。
	 * @param key 事件key
	 * @param revenue 事件收入额，单位为分
	 * @param currency 事件币种
	 */
	public static void trackEvent(String key, int revenue, String currency){
		AdjustEvent adjustEvent = new AdjustEvent(key);
		adjustEvent.setRevenue(revenue, currency);
		Adjust.trackEvent(adjustEvent);
	}
	
	/**
	 * Called when an activity you launched exits, giving you the requestCode 
	 * you started it with, the resultCode it returned, and any additional data 
	 * from it.
	 */
	public boolean onActivityResult (int requestCode, int resultCode, Intent data) {
		
		return true;
		
	}

	/**
	 * Called when the activity receives th results for permission requests.
	 */
	public boolean onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {

		return true;

	}
	
	
	/**
	 * Called when the activity is starting.
	 */
	public void onCreate (Bundle savedInstanceState) {
		ZSDK.getInstance().activity = mainActivity;
		String appToken = ZSDK.getInstance().getMetaDataKey("adjust_app_token");
		String env = "use".equals(ZSDK.getInstance().getMetaDataKey("adjust_sandbox")) ? AdjustConfig.ENVIRONMENT_SANDBOX : AdjustConfig.ENVIRONMENT_PRODUCTION;
		AdjustConfig config = new AdjustConfig(mainActivity, appToken, env);
		config.setLogLevel(LogLevel.VERBOSE);
		Adjust.initSdk(config);
	}
	
	
	/**
	 * Perform any final cleanup before an activity is destroyed.
	 */
	public void onDestroy () {
		
		
		
	}
	
	
	/**
	 * Called as part of the activity lifecycle when an activity is going into
	 * the background, but has not (yet) been killed.
	 */
	public void onPause () {
		
		
		
	}
	
	
	/**
	 * Called after {@link #onStop} when the current activity is being 
	 * re-displayed to the user (the user has navigated back to it).
	 */
	public void onRestart () {
		
		
		
	}
	
	
	/**
	 * Called after {@link #onRestart}, or {@link #onPause}, for your activity 
	 * to start interacting with the user.
	 */
	public void onResume () {
		
		
		
	}
	
	
	/**
	 * Called after {@link #onCreate} &mdash; or after {@link #onRestart} when  
	 * the activity had been stopped, but is now again being displayed to the 
	 * user.
	 */
	public void onStart () {
		
		
		
	}
	
	
	/**
	 * Called when the activity is no longer visible to the user, because 
	 * another activity has been resumed and is covering this one. 
	 */
	public void onStop () {
		
		
		
	}
	
	
}