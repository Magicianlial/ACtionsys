package mosquittoClient;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttSecurityException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

//import SituationEventHandler.SituationEvent;

/**
 * 消息订阅者
 * 
 * 
 */
public class ClientMQTT {

	public static final String serverURI = "tcp://114.116.55.231:1883";
	public static String TOPIC1 = "communityAgent/AlarmReply";
	public static String TOPIC2 = "securityAgent/AlarmReply";
	private static String clientid = "SmartHomeAgent";
	private static MqttClient client;
	private static MqttConnectOptions options;

	/*
	 * private String userName = "admin"; private String passWord = "admin";
	 */

	private ScheduledExecutorService scheduler;

	/**
	 * 初始化连接参数Options
	 * 
	 * @return initoptions 连接属性设置
	 */
	private MqttConnectOptions initMqttConnectionOptions() {

		MqttConnectOptions initoptions = new MqttConnectOptions();

		// 设置是否清空session,这里如果设置为false表示服务器会保留客户端的连接记录
		// 这里设置为true表示每次连接到服务器都以新的身份连接
		initoptions.setCleanSession(true);
		// 断开后，是否自动连接
		initoptions.setAutomaticReconnect(false);
		// 设置连接的用户名
		initoptions.setUserName("admin");
		// 设置连接的密码
		initoptions.setPassword("admin".toCharArray());
		// 设置超时时间 单位为秒
		initoptions.setConnectionTimeout(30);
		// 设置会话心跳时间 单位为秒 服务器会每隔1.5*20秒的时间向客户端发送个消息判断客户端是否在线，
		// 但这个方法并没有重连的机制
		initoptions.setKeepAliveInterval(80);
		// 选择MQTT版本
		initoptions.setMqttVersion(MqttConnectOptions.MQTT_VERSION_3_1_1);
		/*
		 * MqttTopic topic = client.getTopic(TOPIC2); //
		 * setWill方法，如果项目中需要知道客户端是否掉线可以调用该方法，设置最终端口的通知消息 options.setWill(topic,
		 * "close".getBytes(), 2, true);
		 */

		return initoptions;

	}

	/**
	 * 断线重连
	 *
	 */
	public void startReconnect() {
		
		scheduler = Executors.newSingleThreadScheduledExecutor();

		scheduler.scheduleAtFixedRate(new Runnable() {
			public void run() {
				if (!client.isConnected()) {
					try {
						client.connect(options);

						// 重连后，重新订阅主题
						if (client.isConnected()) {

							// 重新订阅主题
							
							int[] Qos = {2,2};
							String[] topic1 = { TOPIC1,TOPIC2 };
							client.subscribe(topic1,Qos);

						}
						
					} catch (MqttSecurityException e) {
						e.printStackTrace();
					} catch (MqttException e) {
						e.printStackTrace();
					}
				}
			}
		}, 0, 5, TimeUnit.SECONDS);
	}

	/**
	 * 启动订阅者，连接mosquitto服务器 订阅主题
	 */
	public void start() {
		try {
			// host为主机名，clientid即连接MQTT的客户端ID，一般以唯一标识符表示，MemoryPersistence设置clientid的保存形式，默认为以内存保存
			client = new MqttClient(serverURI, clientid, new MemoryPersistence());
			// 设置连接属性options
			options = initMqttConnectionOptions();
			// 设置回调
			client.setCallback(new PushCallback(clientid));
			// 连接broker
			client.connect(options);

			// 订阅消息
			int[] Qos = {2,2};
			String[] topic1 = { TOPIC1,TOPIC2 };
			client.subscribe(topic1,Qos);

		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disconnect() {
		System.out.println("5");
		try {
			// host为主机名，clientid即连接MQTT的客户端ID，一般以唯一标识符表示，MemoryPersistence设置clientid的保存形式，默认为以内存保存
			//client = new MqttClient(serverURI, clientid, new MemoryPersistence());
			// 设置回调
			//client.setCallback(new PushCallback(clientid));
			// 设置连接属性options
			//options = initMqttConnectionOptions();
			// 连接broker
			client.disconnect();
			System.out.println("断开连接成功");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    /**
     * 发布消息参数设置
     * 
     * @param message  发布的消息内容
     *
     */
//    public static void publishService(SituationEvent event) throws MqttException {
//    
//    	
//    
//    		client.publish(event.getTopic(), event.getMessage().getBytes(), event.getQos(), false);	
//    		System.out.println("---发布主题 : " + event.getTopic());
//            System.out.println("---发布消息内容 : " + event.getMessage());
////            System.out.println("---接收消息内容 : " + new String(message.getPayload()));
//          
//            /*       String time=get_Time();
//    		Value.pub_topic=token.getTopics()+"  "+time;*/
//
//	}
  
    
}
