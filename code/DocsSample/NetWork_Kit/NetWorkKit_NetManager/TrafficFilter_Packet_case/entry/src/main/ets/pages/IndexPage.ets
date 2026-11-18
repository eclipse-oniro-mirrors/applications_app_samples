import CreatePacketControllerPage from './CreatePacketControllerPage';
import RulesPage from './RulesPage';
import DestroyPacketControllerPage from './DestroyPacketControllerPage';
import LogPage from './LogPage';
import PacketCallbackPage from './PacketCallbackPage';
import { packetFilterApi } from '../api/PacketFilterApi';

@Entry
@Component
struct IndexPage {
  @State currentTab: number = 0;
  @State controllerIds: number[] = [];

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, index: this.currentTab }) {
        TabContent() {
          CreatePacketControllerPage()
        }
        .tabBar(this.TabBuilder('创建', 0))

        TabContent() {
          RulesPage({controllerIds: this.controllerIds})
        }
        .tabBar(this.TabBuilder('规则', 1))

        TabContent() {
          PacketCallbackPage({controllerIds: this.controllerIds})
        }
        .tabBar(this.TabBuilder('回调', 2))

      }
      .barMode(BarMode.Fixed)
      .onChange((idx: number) => {
        this.currentTab = idx;
        this.controllerIds = packetFilterApi.listIds();
      })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_bg'))
  }

  @Builder TabBuilder(title: string, idx: number) {
    Column({ space: 4 }) {
      Text(title)
        .fontSize(this.currentTab === idx ? 16 : 14)
        .fontWeight(this.currentTab === idx ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.currentTab === idx
          ? $r('app.color.app_primary')
          : $r('app.color.text_secondary'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

export default IndexPage;
