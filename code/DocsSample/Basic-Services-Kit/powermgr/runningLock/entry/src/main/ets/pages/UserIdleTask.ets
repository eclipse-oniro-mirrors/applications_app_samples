// [Start Implement_Background_Idle_Tasks]
// UserIdleTask.ets
import { CommonEventHelper } from './CommonEventHelper';
import { RunningLockUtil } from './RunningLockUtil';
import { commonEventManager } from '@kit.BasicServicesKit';

// 闲时任务类，可参考下方步骤开发
export class UserIdleTask {
  private static subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;

  // 1、初始化监听公共事件以及其他业务流程，示例只完成监听
  public async init(): Promise<void> {
    if (UserIdleTask.subscriber === undefined) {
      // 监听进入强制睡眠和退出强制睡眠公共事件，并保存监听者对象
      UserIdleTask.subscriber = await CommonEventHelper.subscribeSystemCommonEvent(
        {
          events: [
            commonEventManager.Support.COMMON_EVENT_ENTER_FORCE_SLEEP,
            commonEventManager.Support.COMMON_EVENT_EXIT_FORCE_SLEEP,
          ],
        },
        this.onReceiveEvent
      );
    }
  }

  // 2、持锁后执行任务，任务执行完成后释放锁
  public runUserIdleTask(): void {
    RunningLockUtil.holdRunningLock();
    // 开发者需要自行实现执行系统闲时任务的具体业务逻辑，这里是空实现
    console.info('background user idle task run');
    RunningLockUtil.unholdRunningLock();
  }

  // 3、实现收到进入强制睡眠或退出强制睡眠事件的回调函数
  private onReceiveEvent(data: commonEventManager.CommonEventData): void {
    if (data?.event === commonEventManager.Support.COMMON_EVENT_ENTER_FORCE_SLEEP) {
      // 收到进入强制睡眠公共事件后需要在1s内暂停或结束任务（如有），然后释放锁
      RunningLockUtil.unholdRunningLock();
    }
    if (data?.event === commonEventManager.Support.COMMON_EVENT_EXIT_FORCE_SLEEP) {
      // 收到退出强制睡眠公共事件后由业务自行决策是否需要继续执行未完成的任务（如有），示例不做处理
    }
  }
}

// 创建并执行任务
function main() {
  let task: UserIdleTask = new UserIdleTask();
  task.init();
  task.runUserIdleTask();
}
// [End Implement_Background_Idle_Tasks]