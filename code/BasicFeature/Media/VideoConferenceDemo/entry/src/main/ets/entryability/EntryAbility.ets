import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { display, window } from '@kit.ArkUI';
import Constants from '../common/Constants';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    try {
      const windowClass = windowStage.getMainWindowSync();
      windowClass.setWindowSystemBarProperties({
        statusBarContentColor: '#FFFFFF'
      }).catch(() => {
        hilog.info(DOMAIN, 'testTag', '%{public}s', 'setWindowSystemBarProperties failed');
      })
    } catch (error) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'Get windowClass failed');
    }

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
      this.createSubWindow(windowStage);
    });

  }

  createSubWindow(windowStage: window.WindowStage) {
    const displayInfo = display.getDefaultDisplaySync();
    const screenWidth = displayInfo.width;
    const rightMargin = 80;
    const topMargin = 300;
    const startX = screenWidth - Constants.SUB_WINDOW_WIDTH - rightMargin;
    const startY = topMargin;
    windowStage.createSubWindow(Constants.SUB_WINDOW_NAME, (err, subWindow) => {
      if(err.code){
        hilog.error(DOMAIN, 'testTag', 'Failed to create subWindow. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      subWindow.resize(Constants.SUB_WINDOW_WIDTH, Constants.SUB_WINDOW_HEIGHT);
      subWindow.setWindowCornerRadius(8);
      subWindow.setWindowTouchable(true);
      subWindow.moveWindowTo(startX, startY);
      subWindow.setUIContent('pages/SubWindow');
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