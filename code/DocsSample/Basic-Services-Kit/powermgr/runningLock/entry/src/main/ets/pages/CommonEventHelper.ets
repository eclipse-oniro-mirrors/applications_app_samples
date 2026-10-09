// [Start common_event_utility_class]
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';

type SubscriberInfo = commonEventManager.CommonEventSubscribeInfo;
type Subscriber = commonEventManager.CommonEventSubscriber;
type EventData = commonEventManager.CommonEventData;

// 公共事件工具类，用来创建公共事件监听者以及订阅、取消订阅公共事件
export class CommonEventHelper {
  // 创建监听者以及订阅公共事件
  public static async subscribeSystemCommonEvent(info: SubscriberInfo,
    callback: (data: EventData) => void): Promise<Subscriber | undefined> {
    try {
      // 创建监听对象
      const subscriber: Subscriber = await commonEventManager.createSubscriber(info);
      // 订阅指定的公共事件
      commonEventManager.subscribe(subscriber, (err: BusinessError, data: EventData): void => {
        if (err) {
          console.error(`Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        // 监听到公共事件后执行回调
        callback(data);
      });
      // 返回监听者对象
      return subscriber;
    } catch (error) {
      console.error('Failed to subscribe system common event, err: ' + error);
      return undefined;
    }
  }

  // 根据传入的监听者取消订阅公共事件
  public static async unsubscribeSystemCommonEvent(subscriber: Subscriber | undefined): Promise<boolean> {
    try {
      // 取消订阅公共事件
      commonEventManager.unsubscribe(subscriber, (error: BusinessError): void => {
        if (error) {
          console.error(`Failed to unsubscribe. Code is ${error.code}, message is ${error.message}`);
        } else {
          console.info('unsubscribe success');
        }
      });
      return true;
    } catch (error) {
      console.error('Failed to unsubscribe event, err: ' + error);
      return false;
    }
  }
}
// [End common_event_utility_class]