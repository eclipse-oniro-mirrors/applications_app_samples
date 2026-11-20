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

import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../common/Logger';
import { GroupSpec } from '../core/SchemaTypes';
import { TOPIC_NODE_TREE_GROUP } from '../schema/TopicNodeTree';
import { TOPIC_RENDER_PROP_GROUP } from '../schema/TopicRenderProp';
import { TOPIC_BLUR_GROUP } from '../schema/TopicBlur';
import { TOPIC_ANIMATION_GROUP } from '../schema/TopicAnimation';
import { TOPIC_HIT_TEST_GROUP } from '../schema/TopicHitTest';
import { TOPIC_PERFORMANCE_GROUP } from '../schema/TopicPerformance';
import { TOPIC_RECORD_GROUP } from '../schema/TopicRecord';
import { TOPIC_MULTI_DEVICE_GROUP } from '../schema/TopicMultiDevice';
import { TOPIC_LIFECYCLE_GROUP } from '../schema/TopicLifecycle';
import { TOPIC_FRAME_TICK_GROUP } from '../schema/TopicFrameTick';

class TopicEntry {
  public group: GroupSpec;
  public url: string;

  constructor(group: GroupSpec, url: string) {
    this.group = group;
    this.url = url;
  }
}

// 专题目录：按 ArkTS 侧的 RenderNode 使用主题进入对应的专题页面。
@Entry
@Component
struct TopicCatalog {
  private entries: TopicEntry[] = [
    new TopicEntry(TOPIC_NODE_TREE_GROUP, 'pages/TopicNodeTreeDemo'),
    new TopicEntry(TOPIC_RENDER_PROP_GROUP, 'pages/TopicRenderPropDemo'),
    new TopicEntry(TOPIC_BLUR_GROUP, 'pages/TopicBlurDemo'),
    new TopicEntry(TOPIC_ANIMATION_GROUP, 'pages/TopicAnimationDemo'),
    new TopicEntry(TOPIC_HIT_TEST_GROUP, 'pages/TopicHitTestDemo'),
    new TopicEntry(TOPIC_PERFORMANCE_GROUP, 'pages/TopicPerformanceDemo'),
    new TopicEntry(TOPIC_RECORD_GROUP, 'pages/TopicRecordDemo'),
    new TopicEntry(TOPIC_MULTI_DEVICE_GROUP, 'pages/TopicMultiDeviceDemo'),
    new TopicEntry(TOPIC_LIFECYCLE_GROUP, 'pages/TopicLifecycleDemo'),
    new TopicEntry(TOPIC_FRAME_TICK_GROUP, 'pages/TopicFrameTickDemo')
  ];

  private open(url: string): void {
    this.getUIContext().getRouter().pushUrl({ url: url }).catch((error: BusinessError) => {
      Logger.error('topic catalog pushUrl failed, code=' + error.code + ' message=' + error.message);
    });
  }

  private goBack(): void {
    // Router.back 同步返回 void，失败时直接抛异常，此处不再叠加 Promise 链。
    try {
      this.getUIContext().getRouter().back();
    } catch (error) {
      const failure: BusinessError = error as BusinessError;
      Logger.error('topic catalog back failed, code=' + failure.code + ' message=' + failure.message);
    }
  }

  build() {
    Column() {
      Row() {
        Button($r('app.string.back'))
          .id('nav_back_topic_catalog')
          .fontSize(12)
          .height(28)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.goBack();
          })
        Text($r('app.string.topic_title'))
          .id('topic_catalog_page_title')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ top: 4, bottom: 4 })

      Text($r('app.string.topic_catalog_desc'))
        .id('topic_catalog_page_desc')
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ bottom: 10 })

      List({ space: 8 }) {
        ForEach(this.entries, (item: TopicEntry) => {
          ListItem() {
            Column() {
              Row() {
                Text(item.group.title)
                  .id('topic_catalog_item_title_' + item.group.key)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))
                  .layoutWeight(1)
                Text($r('app.string.label_scene_count', item.group.scenes.length))
                  .id('topic_catalog_item_count_' + item.group.key)
                  .fontSize(11)
                  .fontColor($r('app.color.primary'))
              }
              .width('100%')
              Text(item.group.desc)
                .id('topic_catalog_item_desc_' + item.group.key)
                .fontSize(11)
                .fontColor($r('app.color.text_secondary'))
                .width('100%')
                .margin({ top: 4 })
            }
            .width('100%')
            .padding(12)
            .alignItems(HorizontalAlign.Start)
            .backgroundColor($r('app.color.panel'))
            .borderRadius(12)
            .id('topic_catalog_item_' + item.group.key)
            .onClick(() => {
              this.open(item.url);
            })
          }
        }, (item: TopicEntry) => item.group.key)
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
