# homekit-demo

简单实现一个基础的模型

 * 第一阶段：控制家电设备


我理解的大概场景是这样的：
对AI说：“有人的话，就打开风扇。没人就关了哦”

简单逻辑

	开启一个监控摄像头程序
    识别人脸，
    如果识别到，判断电风扇插座的状态，如果为关，则打开。
    如果未识别到，判断电风扇插座的状态，如果未开，则关闭。

架构图    
![image](mind.jpg)