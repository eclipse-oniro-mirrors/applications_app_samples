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

/** 方案 A 示例首页：Navigation 三件套与深栈补推。 */
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
    // 深栈补推时机：此时系统栈恢复已完成、页面已渲染；禁止提前到 loadContent 回调
    // （系统恢复尚未执行，会互相冲突）。恢复启动时首页的自动跳转（如广告页）必须跳过，
    // 否则会把恢复出来的栈顶页挤掉。
    this.replayDeepStack();
  }
  // [End deep_stack_replay_timing]

  // [Start deep_stack_replay]
  /** 按保存的路径快照补齐系统未恢复的深层级。 */
  private replayDeepStack(): void {
    const navPath = AppStorage.get<string>(KEY_RESTORE_NAV_PATH);
    if (navPath === undefined) {
      return;
    }
    AppStorage.delete(KEY_RESTORE_NAV_PATH);
    try {
      const names: string[] = JSON.parse(navPath) as string[];
      const current: string[] = this.pathStack.getAllPathName();
      // 从系统已恢复的层数起逐层补齐；补推失败则停在已恢复页，不白屏
      for (let i = current.length; i < names.length; i++) {
        this.pathStack.pushPathByName(names[i], {} as Record<string, Object>);
      }
    } catch (e) {
      // 快照损坏则跳过补推
    }
  }
  // [End deep_stack_replay]

  // [Start nav_snapshot_report]
  /** 每次导航后把路径快照发布到 AppStorage，onSaveState 同步读取。 */
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
        Button('router页面恢复示例')
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
    // 三件套之 2：默认 false，必须显式开启（API版本14+）
    .recoverable(true)
    .mode(NavigationMode.Stack)
    // [End nav_three_piece]
  }
}
