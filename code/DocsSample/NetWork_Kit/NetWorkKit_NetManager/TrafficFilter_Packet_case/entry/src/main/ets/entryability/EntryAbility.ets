import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { packetFilterApi } from '../api/PacketFilterApi';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {

    AppStorage.setOrCreate('callLogs', packetFilterApi.logs);
    AppStorage.setOrCreate('controllerIds', packetFilterApi.listIds());
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/IndexPage', (err) => {
      if (err.code) {
        console.error(`[NetPacket] loadContent failed, code=${err.code} msg=${err.message ?? ''}`);
        return;
      }
      console.info('[NetPacket] loadContent success');
    });
  }

  onDestroy(): void {
    console.info('[NetPacket] EntryAbility onDestroy');
  }
}
