import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { runningLock } from '@kit.BasicServicesKit';
import { RunningLockUtil } from '../../../main/ets/pages/RunningLockUtil';
import { CommonEventHelper } from '../../../main/ets/pages/CommonEventHelper';
import { UserIdleTask } from '../../../main/ets/pages/UserIdleTask';

export default function abilityTest() {
  describe('PreventSystemSleepTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // 校验设备是否支持BACKGROUND_USER_IDLE类型运行锁
    it('isSupportedCheck', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'isSupportedCheck begin');
      let supported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
      hilog.info(0x0000, 'testTag', 'BACKGROUND_USER_IDLE supported: %{public}s', String(supported));
      expect(typeof supported).assertEqual('boolean');
    })

    // 校验未持锁时释放锁不崩溃
    it('unholdWithoutHold', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'unholdWithoutHold begin');
      // 未持有锁时调用unhold，应正常处理不抛异常
      try {
        RunningLockUtil.unholdRunningLock();
        expect(true).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'unholdWithoutHold failed, err: %{public}s', String(err));
        expect(false).assertTrue();
      }
    })

    // 校验持有并释放运行锁流程
    it('holdAndUnholdRunningLock', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'holdAndUnholdRunningLock begin');
      try {
        RunningLockUtil.holdRunningLock();
        // 持锁后recordLock应不为空
        expect(RunningLockUtil.recordLock !== undefined).assertTrue();
        RunningLockUtil.unholdRunningLock();
        expect(true).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'holdAndUnholdRunningLock failed, err: %{public}s', String(err));
        expect(false).assertTrue();
      }
    })

    // 校验UserIdleTask实例化
    it('userIdleTaskInstance', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'userIdleTaskInstance begin');
      let task: UserIdleTask = new UserIdleTask();
      expect(task !== null && task !== undefined).assertTrue();
    })

    // 校验UserIdleTask初始化（订阅公共事件）不抛异常
    it('userIdleTaskInit', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'userIdleTaskInit begin');
      let task: UserIdleTask = new UserIdleTask();
      try {
        await task.init();
        expect(true).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'userIdleTaskInit failed, err: %{public}s', String(err));
        expect(false).assertTrue();
      }
    })

    // 校验UserIdleTask执行闲时任务不抛异常
    it('userIdleTaskRun', 0, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'userIdleTaskRun begin');
      let task: UserIdleTask = new UserIdleTask();
      try {
        task.runUserIdleTask();
        expect(true).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'userIdleTaskRun failed, err: %{public}s', String(err));
        expect(false).assertTrue();
      }
    })

    // 校验CommonEventHelper订阅与取消订阅
    it('commonEventSubscribeAndUnsubscribe', 0, async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'commonEventSubscribeAndUnsubscribe begin');
      try {
        let subscriber = await CommonEventHelper.subscribeSystemCommonEvent(
          { events: ['usual.event.data.scrubber.message'] },
          (data) => {
            hilog.info(0x0000, 'testTag', 'received event: %{public}s', JSON.stringify(data));
          }
        );
        expect(subscriber !== undefined).assertTrue();
        let result = await CommonEventHelper.unsubscribeSystemCommonEvent(subscriber);
        expect(result).assertTrue();
      } catch (err) {
        hilog.error(0x0000, 'testTag', 'commonEventSubscribeAndUnsubscribe failed, err: %{public}s', String(err));
        expect(false).assertTrue();
      }
    })
  })
}
