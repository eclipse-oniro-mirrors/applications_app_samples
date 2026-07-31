// ets/pages/Index.ets
// 示例应用的主页面，用于创建按钮调用接口启动目标Ability
import { common, StartOptions, Want } from '@kit.AbilityKit';
@Entry
@Component
struct Index {
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext
  build() {
    Row() {
      Row() {
        Button('启动测试窗口')
          .onClick(() => {
            // 定义目标Ability的want参数
            let want: Want = {
              deviceId: '',
              bundleName: 'com.example.setwindowlimitsbystartoptions',
              moduleName: 'entry',
              abilityName: 'WindowTestAbility',
            }
            let options: StartOptions = {
              displayId: 0,
              minWindowWidth: 600,
              minWindowHeight: 500,
              maxWindowWidth: 1500,
              maxWindowHeight: 1000,
            };
            try {
              // 启动目标Ability
              this.context.startAbility(want, options, (err: BusinessError) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                // 执行正常业务
                console.info('startAbility succeed');
              });
            } catch (err) {
              // 处理入参错误异常
              let code = (err as BusinessError).code;
              let message = (err as BusinessError).message;
              console.error(`startAbility failed, code is ${code}, message is ${message}`);
            }
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
