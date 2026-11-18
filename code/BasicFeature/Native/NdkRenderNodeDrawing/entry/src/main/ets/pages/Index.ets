/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

class DemoEntry {
  public key: string;
  public title: Resource;
  public description: Resource;
  public url: string;

  constructor(key: string, title: Resource, description: Resource, url: string) {
    this.key = key;
    this.title = title;
    this.description = description;
    this.url = url;
  }
}

@Entry
@Component
struct Index {
  private demos: DemoEntry[] = [
    new DemoEntry('draw', $r('app.string.draw_title'), $r('app.string.draw_desc'), 'pages/DrawDemo'),
    new DemoEntry('primitive', $r('app.string.primitive_title'), $r('app.string.primitive_desc'),
      'pages/PrimitiveDemo'),
    new DemoEntry('effect', $r('app.string.effect_title'), $r('app.string.effect_desc'), 'pages/EffectDemo'),
    new DemoEntry('transform', $r('app.string.transform_title'), $r('app.string.transform_desc'),
      'pages/TransformDemo'),
    new DemoEntry('image', $r('app.string.image_title'), $r('app.string.image_desc'), 'pages/ImageDemo'),
    new DemoEntry('text', $r('app.string.text_title'), $r('app.string.text_desc'), 'pages/TextDemo'),
    new DemoEntry('node_tree', $r('app.string.node_tree_title'), $r('app.string.node_tree_desc'),
      'pages/NodeTreeDemo'),
    new DemoEntry('render_property', $r('app.string.render_property_title'),
      $r('app.string.render_property_desc'), 'pages/RenderPropertyDemo'),
    new DemoEntry('blur', $r('app.string.blur_title'), $r('app.string.blur_desc'), 'pages/BlurDemo'),
    new DemoEntry('lifecycle', $r('app.string.lifecycle_title'), $r('app.string.lifecycle_desc'),
      'pages/LifecycleDemo'),
    new DemoEntry('capability', $r('app.string.capability_title'), $r('app.string.capability_desc'),
      'pages/Catalog'),
    new DemoEntry('topic', $r('app.string.topic_title'), $r('app.string.topic_desc'), 'pages/TopicCatalog')
  ];

  private openDemo(url: string): void {
    // UIContext 提供的路由对象替代已废弃的全局 router。
    this.getUIContext().getRouter().pushUrl({ url: url }).catch((err: BusinessError) => {
      Logger.error('pushUrl failed, code=' + err.code + ' message=' + err.message);
    });
  }

  build() {
    Column() {
      Text($r('app.string.index_title'))
        .id('index_title')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .width('100%')
        .margin({ top: 8 })
      Text($r('app.string.index_subtitle'))
        .id('index_subtitle')
        .fontSize(14)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 12 })
      List({ space: 8 }) {
        ForEach(this.demos, (item: DemoEntry) => {
          ListItem() {
            Column() {
              Text(item.title)
                .id('index_item_title_' + item.key)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .fontColor($r('app.color.text_primary'))
              Text(item.description)
                .id('index_item_desc_' + item.key)
                .fontSize(12)
                .fontColor($r('app.color.text_secondary'))
                .margin({ top: 4 })
            }
            .width('100%')
            .padding(12)
            .alignItems(HorizontalAlign.Start)
            .backgroundColor($r('app.color.card_background'))
            .borderRadius(12)
            .id('index_item_' + item.key)
            .onClick(() => {
              this.openDemo(item.url);
            })
          }
        }, (item: DemoEntry) => item.url)
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
