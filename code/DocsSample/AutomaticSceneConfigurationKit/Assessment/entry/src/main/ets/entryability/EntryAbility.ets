import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../common/utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`onCreate, failed to set color mode, code: ${err.code}, message: ${err.message}`);
    }
    Logger.info('Ability onCreate');
  }

  onDestroy(): void {
    Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability onWindowStageCreate');
    windowStage.loadContent('pages/IndexPage', (error: BusinessError) => {
      if (error !== undefined && error.code !== 0) {
        Logger.error(`onWindowStageCreate, failed to load content, code: ${error.code}`);
        return;
      }
      Logger.info('onWindowStageCreate, content loaded');
      this.setupImmersiveWindow(windowStage);
    });
  }

  private async setupImmersiveWindow(windowStage: window.WindowStage): Promise<void> {
    try {
      const mainWindow: window.Window = await windowStage.getMainWindow();

      try {
        await mainWindow.setWindowMode(window.WindowMode.FULLSCREEN);
        Logger.info('setupImmersiveWindow: setWindowMode FULLSCREEN done');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        Logger.info(`setupImmersiveWindow: setWindowMode not supported on this device, code: ${err.code}`);
      }

      try {
        mainWindow.setWindowDecorVisible(false);
        Logger.info('setupImmersiveWindow: setWindowDecorVisible done');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        Logger.info(`setupImmersiveWindow: setWindowDecorVisible not supported on this device, code: ${err.code}`);
      }
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`setupImmersiveWindow failed, code: ${err.code}, message: ${err.message}`);
    }
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability onForeground');
  }

  onBackground(): void {
    Logger.info('Ability onBackground');
  }
}
