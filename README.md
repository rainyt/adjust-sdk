# Adjust SDK
适用于Android OpenFL的AdjustSDK。

# 基础配置
请在project.xml中配置参数：
```xml
<haxelib name="adjust-sdk"/>
<!-- 设置AppToken -->
<set name="adjust_app_token" value="{YourAppToken}"/>
<!-- 如果不需要沙箱模式时，请注释它 -->
<define name="adjust_sandbox"/>
```