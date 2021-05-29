package mosquittoClient;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import com.servlet.Value;



/**
 * 发布消息的回调类
 * 
 * 必须实现MqttCallback（MqttCallbackExtended）的接口并实现对应的相关接口方法CallBack 类将实现 MqttCallBack。
 * 每个客户机标识都需要一个回调实例。在此示例中，构造函数传递客户机标识以另存为实例数据。
 * 在回调中，将它用来标识已经启动了该回调的哪个实例。
 * 必须在回调类中实现以下几个方法：
 * 
 * public void  connectComplete(boolean reconnect, String serverURI) 连接成功的提示
 * 
 * public void messageArrived(MqttTopic topic, MqttMessage message)接收已经预订的发布
 * 
 * public void connectionLost(Throwable cause)在断开连接时调用
 * 
 * public void deliveryComplete(MqttDeliveryToken token)) 接收到已经发布的 QoS 1 或  QoS 2
 * 消息的传递令牌时调用。MqttClient.connect 激活此回调。
 * 
 */
public class PushCallback implements MqttCallbackExtended {
	private String clientType = "";
	public static MqttMessage str;
	public static int i=0;
//	private static MessageEvent rescueEvent;
	
	public PushCallback(String type) {
		this.clientType = type;
	}

	public void  connectComplete(boolean reconnect, String serverURI) {
		
		System.out.println(clientType+"---连接成功！");
		
		String time=get_Time();
		Value.connect_state=clientType+"---连接成功！  "+time;
		
	}
	
    public void connectionLost(Throwable cause) {
        // 连接丢失后，在这里面进行重连
        System.out.println(clientType+"---连接断开，可以做重连");
        ClientMQTT client = new ClientMQTT();
        client.startReconnect();
      
    }
    
    public void deliveryComplete(IMqttDeliveryToken token) {
        System.out.println(clientType+"---deliveryComplete---" + token.isComplete());
        
        String time=get_Time();
        if(token.getTopics()[token.getTopics().length-1].equals("fireAlarm")){
	//	Value.pub_topic=i++ +token.getTopics()[token.getTopics().length-1]+"  "+time;
        	Value.pub_topic="发出火灾警报！"+"  "+time;
        }/*else if (token.getTopics()[token.getTopics().length-1].equals("gasAlarm")) {
        	
        	Value.pub_topic="发出天然气泄漏警报！"+"  "+time;
		}*/
    }

    public void messageArrived(String topic, MqttMessage message) throws Exception {
        // subscribe后得到的消息会执行到这里,根据主题判断相应的处理
    	
    	//收到的主题topic对应事件分析
//    		PushCallback.str=message;
//    		if (topic.equals("securityAgent/AlarmReply")) {
//    			
//    			String time=get_Time();
//    			Value.receive_topic="安防中心求援回复事件！ "+time;
//    			
//    			//创建监听器对象
//    			MessageEventSource source1=new MessageEventSource();
//    			//注册事件监听器
//				source1.addRescueEventListener(new rescueEventListener());
//				rescueEvent=new MessageEvent(source1);
//				//通知事件监听器
//				source1.notifyRescueEventListener(rescueEvent);
//				
//    			
//			}else if (topic.equals("communityAgent/AlarmReply")) {
//				
//				String time=get_Time();
//    			Value.receive_topic="社区中心求援回复事件！ "+time;
//				
//    			MessageEventSource source1=new MessageEventSource();
//				source1.addRescueEventListener(new rescueEventListener());
//				rescueEvent=new MessageEvent(source1);
//				source1.notifyRescueEventListener(rescueEvent);
//				
//			}
				    		
/*    		System.out.println(clientType+"---接收消息主题 : " + topic);
            System.out.println(clientType+"---接收消息Qos : " + message.getQos());
            System.out.println(clientType+"---接收消息内容 : " + new String(message.getPayload()));*/    	 
        
    }
    
    //用来给调用处返回消息内容
    public static MqttMessage getMessage() {
    	
        return str;
    }

    public String get_Time() {
   
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
    	String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
    	return date;
		
	}

}



