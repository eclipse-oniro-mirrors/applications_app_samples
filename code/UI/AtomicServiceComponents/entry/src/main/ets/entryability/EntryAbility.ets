import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { Logger } from '../utils/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability', '生命周期',
      `onCreate launchReason=${launchParam.launchReason} bundle=${want.bundleName} ability=${want.abilityName}`);
  }

  onDestroy(): void {
    Logger.info('Ability', '生命周期', 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    Logger.info('Ability', '生命周期', 'onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error('Ability', '生命周期', `加载 pages/Index 失败：${err.code} ${err.message}`);
        return;
      }
      Logger.info('Ability', '生命周期', 'pages/Index 加载完成');
    });

    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      Logger.debug('Ability', '配置', '颜色模式跟随系统');
    } catch (err) {
      Logger.error('Ability', '配置', `设置颜色模式失败：${JSON.stringify(err)}`);
    }
  }

  onWindowStageDestroy(): void {
    Logger.info('Ability', '生命周期', 'onWindowStageDestroy');
  }

  onForeground(): void {
    Logger.info('Ability', '生命周期', 'onForeground');
  }

  onBackground(): void {
    Logger.info('Ability', '生命周期', 'onBackground');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Logger.info('Ability', '生命周期',
      `onNewWant launchReason=${launchParam.launchReason} bundle=${want.bundleName} ability=${want.abilityName}`);
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    Logger.info('Ability', '配置',
      `onConfigurationUpdate direction=${newConfig.direction} colorMode=${newConfig.colorMode} ` +
        `fontScale=${newConfig.fontSizeScale}`);
  }
}
