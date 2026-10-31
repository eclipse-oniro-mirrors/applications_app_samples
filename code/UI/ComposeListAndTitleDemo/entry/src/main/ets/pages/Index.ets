/**
 * ComposeListAndTitleDemo 主页面
 * 分区展示：ComposeTitleBar(V1) / ComposeTitleBarV2 / ComposeListItem(V1) / ComposeListItemV2
 * 布局适配：sm（<600vp）单栏；md/lg（平板/2in1/横屏）左演示右日志双栏
 * 所有交互（菜单点击/箭头/开关/按钮/搜索）均输出日志。
 */
import { LogUtil } from '../model/utils/LogUtil';
import { DeviceUtil, Breakpoint } from '../model/utils/DeviceUtil';
import { ContactStore, ContactItem, ListConfigFactory } from '../model/ListModels';
import {
  ComposeListItem, ComposeListItemV2, ComposeTitleBar, ComposeTitleBarV2,
  IconType, IconTypeV2, ContentItem, OperateItem
} from '@kit.ArkUI';

const MAX_LOG_COUNT = 120;

@Entry
@Component
struct Index {
  @State logs: string[] = [];
  @State bp: Breakpoint = 'sm';
  @State deviceType: string = '';
  @State osName: string = '';
  @State apiVersion: number = 0;
  @State keyword: string = '';
  @State shownContacts: ContactItem[] = [];
  private store: ContactStore = new ContactStore();

  aboutToAppear(): void {
    LogUtil.init((line: string) => {
      this.pushLog(line);
    });
    this.deviceType = DeviceUtil.getDeviceType();
    this.osName = DeviceUtil.getOsFullName();
    this.apiVersion = DeviceUtil.getSdkApiVersion();
    DeviceUtil.logDeviceProfile();
    // 初始联系人数据：通讯录场景
    this.store.add('张三', '13800000001', '研发部', true);
    this.store.add('李四', '13800000002', '产品部', false);
    this.store.add('王五', '13800000003', '研发部', true);
    this.store.add('赵六', '13800000004', '测试部', false);
    this.refreshList();
    LogUtil.info('Index', `初始联系人 ${this.store.count()} 人，在线 ${this.store.onlineCount()} 人`);
  }

  private pushLog(line: string): void {
    this.logs = [line, ...this.logs].slice(0, MAX_LOG_COUNT);
  }

  private refreshList(): void {
    this.shownContacts = this.store.search(this.keyword);
  }

  /** 分区1：ComposeTitleBar V2——标题/副标题/头像/菜单（API 26 新增） */
  @Builder
  sectionTitleBarV2() {
    Column({ space: 6 }) {
      Text('ComposeTitleBarV2（API 26 新增）').fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      ComposeTitleBarV2({
        title: '团队通讯录',
        subtitle: `共 ${this.store.count()} 人 · 在线 ${this.store.onlineCount()} 人`,
        item: ListConfigFactory.buildV2MenuItem('头像', (): void => {
          LogUtil.info('Index', 'TitleBarV2 头像点击');
        }),
        menuItems: [
          ListConfigFactory.buildV2MenuItem('搜索', (): void => {
            LogUtil.info('Index', 'TitleBarV2 菜单「搜索」点击');
          }),
          ListConfigFactory.buildV2MenuItem('更多', (): void => {
            LogUtil.info('Index', 'TitleBarV2 菜单「更多」点击');
          })
        ]
      })
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区2：ComposeListItem V1——箭头/开关/按钮三种操作区 */
  @Builder
  sectionListItemV1() {
    Column({ space: 6 }) {
      Text('ComposeListItem（V1，API 10+）').fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      Text('内容区：头像 + 主/副文本；操作区三种形态').fontSize(11).fontColor('#888888').width('100%')
      Column({ space: 4 }) {
        ForEach(this.shownContacts, (c: ContactItem) => {
          ComposeListItem({
            contentItem: ListConfigFactory.buildV1ContentItem(
              $r('app.media.startIcon'), IconType.HEAD_SCULPTURE, c.name, `${c.dept} · ${c.phone}`),
            operateItem: ListConfigFactory.buildV1OperateArrow((): void => {
              LogUtil.info('Index', `V1 列表项箭头点击：${c.name}`);
            })
          })
          .width('100%')
        }, (c: ContactItem) => `v1-${c.id}`)
      }
      .width('100%')

      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.NORMAL_ICON, '消息免打扰', '对该联系人静音'),
        operateItem: ListConfigFactory.buildV1OperateSwitch(false, (v: boolean): void => {
          LogUtil.info('Index', `V1 开关切换 → ${v}`);
        })
      })
      .width('100%')

      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.APP_ICON, '安装更新', '版本 1.0.0 可用'),
        operateItem: ListConfigFactory.buildV1OperateButton('安装')
      })
      .width('100%')

      // 复选框操作区
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.NORMAL_ICON, '同步到云端', '自动备份联系人'),
        operateItem: ListConfigFactory.buildV1OperateCheckbox(true, (v: boolean): void => {
          LogUtil.info('Index', `V1 复选框切换 → ${v}`);
        })
      })
      .width('100%')

      // 单选按钮操作区
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.NORMAL_ICON, '默认铃声', '来电通知音选择'),
        operateItem: ListConfigFactory.buildV1OperateRadio(false, (v: boolean): void => {
          LogUtil.info('Index', `V1 单选按钮切换 → ${v}`);
        })
      })
      .width('100%')

      // 双图标操作区（icon + subIcon）
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.SYSTEM_ICON, '收藏与分享', '右侧双图标操作'),
        operateItem: ListConfigFactory.buildV1OperateDoubleIcon((): void => {
          LogUtil.info('Index', 'V1 双图标：第一个图标点击');
        }, (): void => {
          LogUtil.info('Index', 'V1 双图标：第二个图标点击');
        })
      })
      .width('100%')

      // BADGE 档位（8vp 小徽标）+ 三行文本（description）
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItemWithDesc(
          $r('app.media.startIcon'), IconType.BADGE, '未读消息', '含 3 条置顶',
          '长按可标记全部已读，description 支持换行显示'),
        operateItem: ListConfigFactory.buildV1OperateText('3 条')
      })
      .width('100%')

      // PREVIEW 档位（96vp 预览图）
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.PREVIEW, '图片预览', 'PREVIEW 档位 96vp'),
        operateItem: ListConfigFactory.buildV1OperateImage($r('app.media.startIcon'))
      })
      .width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  /** 分区3：ComposeListItemV2——toggle/按钮/箭头（API 26 新增） */
  @Builder
  sectionListItemV2() {
    Column({ space: 6 }) {
      Text('ComposeListItemV2（API 26 新增）').fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      Text('同数据 V2 版：new ContentItemV2/OperateItemV2 构造，toggle 字段替代 V1 switch').fontSize(11)
        .fontColor('#888888').width('100%')
      Column({ space: 4 }) {
        ForEach(this.shownContacts, (c: ContactItem) => {
          ComposeListItemV2({
            contentItemV2: ListConfigFactory.buildV2ContentItem(
              $r('app.media.startIcon'), IconTypeV2.HEAD_SCULPTURE, c.name, `${c.dept} · ${c.phone}`),
            operateItemV2: ListConfigFactory.buildV2OperateToggle(c.online, (v: boolean): void => {
              const r: boolean | null = this.store.toggleOnline(c.id);
              this.refreshList();
              LogUtil.info('Index', `V2 toggle「${c.name}」→ ${r !== null ? String(r) : '未找到'}`);
            })
          })
          .width('100%')
        }, (c: ContactItem) => `v2-${c.id}`)
      }
      .width('100%')

      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.SYSTEM_ICON, '系统更新', '检查新版本'),
        operateItemV2: ListConfigFactory.buildV2OperateButton('检查')
      })
      .width('100%')

      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.NORMAL_ICON, '关于本机', '查看设备信息'),
        operateItemV2: ListConfigFactory.buildV2OperateArrow((): void => {
          LogUtil.info('Index', 'V2 列表项箭头点击：关于本机');
        })
      })
      .width('100%')

      // V2 复选框操作区
      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.NORMAL_ICON, '多选模式', 'checkbox 操作区'),
        operateItemV2: ListConfigFactory.buildV2OperateCheckbox(false, (v: boolean): void => {
          LogUtil.info('Index', `V2 复选框切换 → ${v}`);
        })
      })
      .width('100%')

      // V2 双图标操作区
      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.SYSTEM_ICON, '收藏与分享', '右侧双图标操作'),
        operateItemV2: ListConfigFactory.buildV2OperateDoubleIcon((): void => {
          LogUtil.info('Index', 'V2 双图标：第一个图标点击');
        }, (): void => {
          LogUtil.info('Index', 'V2 双图标：第二个图标点击');
        })
      })
      .width('100%')

      // V2 PREVIEW 档位 + 三行文本
      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItemWithDesc(
          $r('app.media.startIcon'), IconTypeV2.PREVIEW, '图片预览', 'PREVIEW 档位 96vp',
          'V2 版三行文本：primaryText + secondaryText + description'),
        operateItemV2: ListConfigFactory.buildV2OperateText('预览')
      })
      .width('100%')
    }
    .width('100%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor('#FAFAFA')
  }

  @Builder
  logArea() {
    Column({ space: 4 }) {
      Row({ space: 8 }) {
        Text('事件日志').fontSize(14).fontWeight(FontWeight.Medium)
        Blank()
        Text(`断点：${this.bp}`).fontSize(11).fontColor('#999999')
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.logs, (line: string, index: number) => {
          ListItem() {
            Text(line).fontSize(12).width('100%')
          }
        }, (line: string, index: number) => `${index}-${line}`)
      }
      .layoutWeight(1)
      .width('100%')
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .padding(8)
    }
    .layoutWeight(1)
    .width('100%')
  }

  build() {
    Column() {
      // 页面级标题栏：ComposeTitleBar V1（item 头像 + title + subtitle + 右侧菜单）
      ComposeTitleBar({
        title: '列表与标题',
        subtitle: 'ComposeListItem/V2 · ComposeTitleBar/V2',
        item: ListConfigFactory.buildV1MenuItem('头像', (): void => {
          LogUtil.info('Index', 'TitleBarV1 头像点击');
        }),
        menuItems: [
          ListConfigFactory.buildV1MenuItem('刷新', (): void => {
            this.refreshList();
            LogUtil.info('Index', `TitleBarV1 菜单「刷新」，当前展示 ${this.shownContacts.length} 人`);
          }),
          ListConfigFactory.buildV1MenuItem('设置', (): void => {
            LogUtil.info('Index', 'TitleBarV1 菜单「设置」点击');
          })
        ]
      })

      Row({ space: 10 }) {
        Text(`设备：${this.deviceType}`).fontSize(12)
        Text(`API：${this.apiVersion}`).fontSize(12)
        Text(this.osName).fontSize(12).layoutWeight(1).maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F0FE')
      .borderRadius(8)

      // 搜索框：驱动 ContactStore.search
      TextInput({ placeholder: '搜索姓名或部门', text: this.keyword })
        .width('100%')
        .height(40)
        .onChange((v: string) => {
          this.keyword = v;
          this.refreshList();
        })

      if (this.bp === 'sm') {
        Scroll() {
          Column({ space: 12 }) {
            this.sectionTitleBarV2()
            this.sectionListItemV1()
            this.sectionListItemV2()
          }
          .width('100%')
        }
        .layoutWeight(1)
        .width('100%')
        .scrollBar(BarState.Auto)
        Column() {
          this.logArea()
        }
        .width('100%')
        .height(200)
      } else {
        Row({ space: 12 }) {
          Scroll() {
            Column({ space: 12 }) {
              this.sectionTitleBarV2()
              this.sectionListItemV1()
              this.sectionListItemV2()
            }
            .width('100%')
          }
          .layoutWeight(1)
          .scrollBar(BarState.Auto)

          Column() {
            this.logArea()
          }
          .width('38%')
        }
        .layoutWeight(1)
        .alignItems(VerticalAlign.Top)
      }
    }
    .padding(16)
    .width('100%')
    .height('100%')
    .onAreaChange((_oldArea: Area, newArea: Area) => {
      const widthVp: number = Number(newArea.width);
      const next: Breakpoint = DeviceUtil.getBreakpoint(widthVp);
      if (next !== this.bp) {
        this.bp = next;
        LogUtil.info('Index', `窗口宽度 ${widthVp.toFixed(0)}vp，断点切换为 ${next}`);
      }
    })
  }
}
