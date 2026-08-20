import { AbilityConstant, ConfigurationConstant, Context, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit'
import { backgroundLoader } from '@kit.BackgroundTasksKit'
import { BusinessError } from '@kit.BasicServicesKit'

const DOMAIN = 0x0000;

let appContext: Context | null = null

class MyMessageAble implements rpc.Parcelable {
  name: string
  str: string
  num: number = 1

  constructor(name:string, str: string) {
    this.name = name;
    this.str = str;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    messageSequence.writeString(this.str);
    console.info(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    this.str = messageSequence.readString();
    console.info(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }
}

function funCallBack(pdata: rpc.MessageSequence): rpc.Parcelable {
  hilog.info(DOMAIN, 'testTag', 'Task started [backgroundLoader.PN_START callback]');
  // background loader task
  return new MyMessageAble('test1', 'Running...');
}

function onStopCallBack(pdata: rpc.MessageSequence): rpc.Parcelable {
  hilog.info(DOMAIN, 'testTag', 'Task stopped');
  const taskId: number = pdata.readInt();
  const abilityName: string = pdata.readString();
  const stopCode: number = pdata.readInt();
  const message: string = pdata.readString();
  hilog.info(DOMAIN, 'testTag', 'onStopCallBack: taskId=%{public}d, stopCode=%{public}d, message=%{public}s',
    taskId, stopCode, message);
  return new MyMessageAble('onStop', message);
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    try {
      this.callee.on(backgroundLoader.ON_START, funCallBack);
      this.callee.on(backgroundLoader.ON_STOP, onStopCallBack);
    } catch (error) {
      console.error(`Callee.on catch error, error.code: ${error.code}, error.message: ${error.message}`);
    }
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

export class TestCases {
  async registerTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'registerTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.registerTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'registerTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'registerTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
  }

  async unregisterTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'unregisterTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.unregisterTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'unregisterTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'unregisterTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
  }

  async finishTask(abilityname: string, taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'finishTask: abilityName=%{public}s, taskId=%{public}d', abilityname, taskId);
    const taskInfo: backgroundLoader.TaskInfo = {
      abilityname: abilityname,
      taskId: taskId
    };
    try {
      backgroundLoader.finishTask(taskInfo);
      hilog.info(DOMAIN, 'testTag', 'finishTask successes');
      return 'Success';
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'finishTask failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
  }

  async getTaskInfo(taskId: number): Promise<string> {
    hilog.info(DOMAIN, 'testTag', 'getTaskInfo: taskId=%{public}d', taskId);
    try {
      const taskInfoData = backgroundLoader.getTaskInfo(taskId);
      const result = `taskId=${taskInfoData.taskId}, abilityName=${taskInfoData.abilityName}`;
      hilog.info(DOMAIN, 'testTag', 'getTaskInfo result: %{public}s', result);
      return result;
    } catch (err) {
      const errMsg = JSON.stringify(err);
      hilog.error(DOMAIN, 'testTag', 'getTaskInfo failed: %{public}s', errMsg);
      return `Failed: ${(err as BusinessError).message ?? errMsg}`;
    }
  }
}

export const testCases: TestCases = new TestCases();