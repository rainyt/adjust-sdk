package;


import lime.system.CFFI;
import lime.system.JNI;


class AdjustSdk {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if android
		
		var resultJNI = adjustsdk_sample_method_jni(inputValue);
		var resultNative = adjustsdk_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return adjustsdk_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var adjustsdk_sample_method = CFFI.load ("adjustsdk", "adjustsdk_sample_method", 1);
	
	#if android
	private static var adjustsdk_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.AdjustSdk", "sampleMethod", "(I)I");
	#end
	
	
}