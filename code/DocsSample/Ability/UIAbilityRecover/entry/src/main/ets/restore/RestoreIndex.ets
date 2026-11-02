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

import { router } from '@kit.ArkUI';
import { ReaderPage } from './ReaderPage';
import { DeepPage } from './DeepPage';

const KEY_NAV_SNAPSHOT = 'reader.navSnapshot';
const KEY_RESTORE_NAV_PATH = 'restore.navPath';

/**
 * 方案 A 示例首页：Navigation 三件套（.id + .recoverable + NavDestination.recoverable）、
 * 深栈补推。
 */
@Entry
@Component
struct RestoreIndex {
  pathStack: NavPathStack = new NavPathStack();
  @State restoreHint: string = '';

  @Builder
  PageMap(name: string) {
    if (name === 'ReaderPage') {
      ReaderPage()
    } else if (name === 'DeepPage') {
      DeepPage()
    }
  }

  // [Start deep_stack_replay_timing]
  onPageShow(): void {
    // 深栈补推时机：首页 onPageShow——此时系统已自动恢复 Navigation 栈顶前 2 页并完成渲染。
    // 禁止在 loadContent 回调中补推（系统栈恢复尚未执行，会与系统恢复互相冲突）。
    // 若首页有"自动跳转广告页/闪屏页"等逻辑，恢复启动这一跳必须跳过，否则会把恢复出来的栈顶页挤掉。
    this.replayDeepStack();
  }
  // [End deep_stack_replay_timing]

  // [Start deep_stack_replay]
  /** 深栈补推：系统只自动恢复栈顶前 2 页，更深层级按保存的路径快照逐层补推。 */
  private replayDeepStack(): void {
    const navPath = AppStorage.get<string>(KEY_RESTORE_NAV_PATH);
    if (navPath === undefined) {
      return;
    }
    AppStorage.delete(KEY_RESTORE_NAV_PATH);
    try {
      const names: string[] = JSON.parse(navPath) as string[];
      for (let i = 2; i < names.length; i++) {
        // 补推失败则停在已恢复页，不白屏
        this.pathStack.pushPathByName(names[i], {} as Record<string, Object>);
      }
    } catch (e) {
      // 快照损坏则跳过补推
    }
  }
  // [End deep_stack_replay]

  // [Start nav_snapshot_report]
  /** 深栈补推数据通道：每次导航后把当前栈路径快照发布到 AppStorage，onSaveState 同步读取。 */
  private reportNavSnapshot(): void {
    AppStorage.setOrCreate(KEY_NAV_SNAPSHOT, JSON.stringify(this.pathStack.getAllPathName()));
  }
  // [End nav_snapshot_report]

  build() {
    // [Start nav_three_piece]
    Navigation(this.pathStack) {
      Column({ space: 12 }) {
        Text('页面栈恢复示例')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
        if (this.restoreHint !== '') {
          Text(this.restoreHint)
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        Button('打开阅读页（断点续读）')
          .width('80%')
          .onClick(() => {
            this.pathStack.pushPathByName('ReaderPage', { bookId: 'book-1001' } as Record<string, Object>);
            this.reportNavSnapshot();
          })
        Button('进入第三层页面（深栈补推演示）')
          .width('80%')
          .onClick(() => {
            this.pathStack.pushPathByName('ReaderPage', { bookId: 'book-1001' } as Record<string, Object>);
            this.pathStack.pushPathByName('DeepPage', {} as Record<string, Object>);
            this.reportNavSnapshot();
          })
        Button('router 页面恢复示例（方案 C）')
          .width('80%')
          .onClick(() => {
            router.pushUrl({ url: 'restore/RouterPage' });
          })
        Text('操作后退到后台等待系统回收，再次启动验证恢复效果')
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .navDestination(this.PageMap)
    // 三件套之 1：恢复按 navigationId 匹配，必须设置
    .id('restore-nav')
    // 三件套之 2：默认 false，必须显式开启（API 14+）
    .recoverable(true)
    .mode(NavigationMode.Stack)
    // [End nav_three_piece]
  }
}
