/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
      Text($r('app.string.section_titlebar_v2')).fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      ComposeTitleBarV2({
        title: $r('app.string.toolbar_team_title'),
        subtitle: $r('app.string.toolbar_team_subtitle', this.store.count(), this.store.onlineCount()),
        item: ListConfigFactory.buildV2MenuItem($r('app.string.titlebar_avatar'), (): void => {
          LogUtil.info('Index', 'TitleBarV2 头像点击');
        }),
        menuItems: [
          ListConfigFactory.buildV2MenuItem($r('app.string.menu_search'), (): void => {
            LogUtil.info('Index', 'TitleBarV2 菜单「搜索」点击');
          }),
          ListConfigFactory.buildV2MenuItem($r('app.string.menu_more'), (): void => {
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
      Text($r('app.string.section_list_v1')).fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      Text($r('app.string.section_list_v1_desc')).fontSize(11).fontColor('#888888').width('100%')
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
          $r('app.media.startIcon'), IconType.NORMAL_ICON,
          $r('app.string.item_dnd_title'), $r('app.string.item_dnd_desc')),
        operateItem: ListConfigFactory.buildV1OperateSwitch(false, (v: boolean): void => {
          LogUtil.info('Index', `V1 开关切换 → ${v}`);
        })
      })
      .width('100%')

      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.APP_ICON,
          $r('app.string.item_update_title'), $r('app.string.item_update_desc')),
        operateItem: ListConfigFactory.buildV1OperateButton($r('app.string.btn_install'))
      })
      .width('100%')

      // 复选框操作区
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.NORMAL_ICON,
          $r('app.string.item_sync_title'), $r('app.string.item_sync_desc')),
        operateItem: ListConfigFactory.buildV1OperateCheckbox(true, (v: boolean): void => {
          LogUtil.info('Index', `V1 复选框切换 → ${v}`);
        })
      })
      .width('100%')

      // 单选按钮操作区
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.NORMAL_ICON,
          $r('app.string.item_ring_title'), $r('app.string.item_ring_desc')),
        operateItem: ListConfigFactory.buildV1OperateRadio(false, (v: boolean): void => {
          LogUtil.info('Index', `V1 单选按钮切换 → ${v}`);
        })
      })
      .width('100%')

      // 双图标操作区（icon + subIcon）
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.SYSTEM_ICON,
          $r('app.string.item_share_title'), $r('app.string.item_share_desc')),
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
          $r('app.media.startIcon'), IconType.BADGE,
          $r('app.string.item_unread_title'), $r('app.string.item_unread_desc'),
          $r('app.string.item_unread_detail')),
        operateItem: ListConfigFactory.buildV1OperateText($r('app.string.operate_3_items'))
      })
      .width('100%')

      // PREVIEW 档位（96vp 预览图）
      ComposeListItem({
        contentItem: ListConfigFactory.buildV1ContentItem(
          $r('app.media.startIcon'), IconType.PREVIEW,
          $r('app.string.item_preview_title'), $r('app.string.item_preview_desc')),
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
      Text($r('app.string.section_list_v2')).fontSize(15).fontWeight(FontWeight.Medium).width('100%')
      Text($r('app.string.section_list_v2_desc')).fontSize(11)
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
          $r('app.media.startIcon'), IconTypeV2.SYSTEM_ICON,
          $r('app.string.item_update_v2_title'), $r('app.string.item_update_v2_desc')),
        operateItemV2: ListConfigFactory.buildV2OperateButton($r('app.string.btn_check'))
      })
      .width('100%')

      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.NORMAL_ICON,
          $r('app.string.item_about_title'), $r('app.string.item_about_desc')),
        operateItemV2: ListConfigFactory.buildV2OperateArrow((): void => {
          LogUtil.info('Index', 'V2 列表项箭头点击：关于本机');
        })
      })
      .width('100%')

      // V2 复选框操作区
      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.NORMAL_ICON,
          $r('app.string.item_multi_title'), $r('app.string.item_multi_desc')),
        operateItemV2: ListConfigFactory.buildV2OperateCheckbox(false, (v: boolean): void => {
          LogUtil.info('Index', `V2 复选框切换 → ${v}`);
        })
      })
      .width('100%')

      // V2 双图标操作区
      ComposeListItemV2({
        contentItemV2: ListConfigFactory.buildV2ContentItem(
          $r('app.media.startIcon'), IconTypeV2.SYSTEM_ICON,
          $r('app.string.item_share_title'), $r('app.string.item_share_desc')),
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
          $r('app.media.startIcon'), IconTypeV2.PREVIEW,
          $r('app.string.item_preview_title'), $r('app.string.item_preview_desc'),
          $r('app.string.item_v2_desc')),
        operateItemV2: ListConfigFactory.buildV2OperateText($r('app.string.btn_preview'))
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
        Text($r('app.string.log_title')).fontSize(14).fontWeight(FontWeight.Medium)
        Blank()
        Text($r('app.string.breakpoint_prefix', this.bp)).fontSize(11).fontColor('#999999')
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
        title: $r('app.string.page_title'),
        subtitle: $r('app.string.page_subtitle'),
        item: ListConfigFactory.buildV1MenuItem($r('app.string.titlebar_avatar'), (): void => {
          LogUtil.info('Index', 'TitleBarV1 头像点击');
        }),
        menuItems: [
          ListConfigFactory.buildV1MenuItem($r('app.string.menu_refresh'), (): void => {
            this.refreshList();
            LogUtil.info('Index', `TitleBarV1 菜单「刷新」，当前展示 ${this.shownContacts.length} 人`);
          }),
          ListConfigFactory.buildV1MenuItem($r('app.string.menu_settings'), (): void => {
            LogUtil.info('Index', 'TitleBarV1 菜单「设置」点击');
          })
        ]
      })

      Row({ space: 10 }) {
        Text($r('app.string.device_prefix', this.deviceType)).fontSize(12)
        Text($r('app.string.api_prefix', this.apiVersion)).fontSize(12)
        Text(this.osName).fontSize(12).layoutWeight(1).maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F0FE')
      .borderRadius(8)

      // 搜索框：驱动 ContactStore.search
      TextInput({ placeholder: $r('app.string.search_placeholder'), text: this.keyword })
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
