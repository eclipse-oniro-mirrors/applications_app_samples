// [Start running_lock_utility_class]
// RunningLockUtil.ets
import { runningLock } from '@kit.BasicServicesKit';

// 运行锁工具类，用来创建运行锁、持锁以及释放锁
export class RunningLockUtil {
  // 保存运行锁对象
  public static recordLock: runningLock.RunningLock | undefined;

  public static holdRunningLock(): void {
    // 通过isSupported接口查询当前设备是否支持该类型锁
    if (!runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE)) {
      console.error('type BACKGROUND_USER_IDLE is not support in the device.');
      return;
    }
    if (RunningLockUtil.recordLock) {
      try {
        // 持锁时长取决于具体业务场景，锁超时自动释放；这里示例持锁5000ms
        RunningLockUtil.recordLock.hold(5000);
        console.info('hold running lock success');
      } catch (err) {
        console.error('hold running lock failed, err: ' + err);
      }
    } else {
      // 创建运行锁，并保存运行锁
      RunningLockUtil.createRunningLockAndHold();
    }
  }

  private static async createRunningLockAndHold(): Promise<void> {
    try {
      const lock = await runningLock.create(
        'running_lock_user_idle',
        runningLock.RunningLockType.BACKGROUND_USER_IDLE
      );
      console.info('create running lock: ' + lock);
      RunningLockUtil.recordLock = lock;
      // 持锁时长取决于具体业务场景，锁超时自动释放；示例持锁5000ms
      lock.hold(5000);
      console.info('hold running lock success');
    } catch (err) {
      console.error('create or hold failed, err: ' + err);
    }
  }

  public static unholdRunningLock(): void {
    if (!RunningLockUtil.recordLock) {
      console.error('lock is null');
      return;
    }
    try {
      // 判断是否持锁，并进行释放操作
      if (RunningLockUtil.recordLock.isHolding()) {
        RunningLockUtil.recordLock.unhold();
        console.info('unhold running lock success');
      }
    } catch (error) {
      console.error('unhold running lock failed, err: ' + error);
    }
  }
}
// [End running_lock_utility_class]