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
import { CANVAS_GROUP } from '../schema/CapabilityCanvas';
import { COLOR_FILTER_GROUP } from '../schema/CapabilityColorFilter';
import { COLOR_GROUP } from '../schema/CapabilityColor';
import { GEOMETRY_GROUP } from '../schema/CapabilityGeometry';
import { PAINT_GROUP } from '../schema/CapabilityPaint';
import { SHADER_GROUP } from '../schema/CapabilityShader';
import { MASK_FILTER_GROUP } from '../schema/CapabilityMaskFilter';
import { IMAGE_FILTER_GROUP } from '../schema/CapabilityImageFilter';
import { BITMAP_GROUP } from '../schema/CapabilityBitmap';
import { PIXELMAP_GROUP } from '../schema/CapabilityPixelMap';
import { IMAGE_IO_GROUP } from '../schema/CapabilityImageIo';
import { FONT_GROUP } from '../schema/CapabilityFont';
import { TEXTBLOB_GROUP } from '../schema/CapabilityTextBlob';
import { TYPOGRAPHY_GROUP } from '../schema/CapabilityTypography';
import { SHADOW_GROUP } from '../schema/CapabilityShadow';
import { MATRIX_GROUP } from '../schema/CapabilityMatrix';
import { RECORD_GROUP } from '../schema/CapabilityRecord';
import { OFFSCREEN_GROUP } from '../schema/CapabilityOffscreen';
import { ERROR_GROUP } from '../schema/CapabilityError';

class CatalogEntry {
  public group: GroupSpec;
  public url: string;

  constructor(group: GroupSpec, url: string) {
    this.group = group;
    this.url = url;
  }
}

// 能力矩阵目录：按能力域进入对应的 schema 驱动演示页面。
@Entry
@Component
struct Catalog {
  private entries: CatalogEntry[] = [
    new CatalogEntry(CANVAS_GROUP, 'pages/CapabilityCanvasDemo'),
    new CatalogEntry(GEOMETRY_GROUP, 'pages/CapabilityGeometryDemo'),
    new CatalogEntry(PAINT_GROUP, 'pages/CapabilityPaintDemo'),
    new CatalogEntry(COLOR_GROUP, 'pages/CapabilityColorDemo'),
    new CatalogEntry(COLOR_FILTER_GROUP, 'pages/CapabilityColorFilterDemo'),
    new CatalogEntry(SHADER_GROUP, 'pages/CapabilityShaderDemo'),
    new CatalogEntry(MASK_FILTER_GROUP, 'pages/CapabilityMaskFilterDemo'),
    new CatalogEntry(IMAGE_FILTER_GROUP, 'pages/CapabilityImageFilterDemo'),
    new CatalogEntry(BITMAP_GROUP, 'pages/CapabilityBitmapDemo'),
    new CatalogEntry(PIXELMAP_GROUP, 'pages/CapabilityPixelMapDemo'),
    new CatalogEntry(IMAGE_IO_GROUP, 'pages/CapabilityImageIoDemo'),
    new CatalogEntry(FONT_GROUP, 'pages/CapabilityFontDemo'),
    new CatalogEntry(TEXTBLOB_GROUP, 'pages/CapabilityTextBlobDemo'),
    new CatalogEntry(TYPOGRAPHY_GROUP, 'pages/CapabilityTypographyDemo'),
    new CatalogEntry(SHADOW_GROUP, 'pages/CapabilityShadowDemo'),
    new CatalogEntry(MATRIX_GROUP, 'pages/CapabilityMatrixDemo'),
    new CatalogEntry(RECORD_GROUP, 'pages/CapabilityRecordDemo'),
    new CatalogEntry(OFFSCREEN_GROUP, 'pages/CapabilityOffscreenDemo'),
    new CatalogEntry(ERROR_GROUP, 'pages/CapabilityErrorDemo')
  ];

  private open(url: string): void {
    this.getUIContext().getRouter().pushUrl({ url: url }).catch((error: BusinessError) => {
      Logger.error('catalog pushUrl failed, code=' + error.code + ' message=' + error.message);
    });
  }

  private goBack(): void {
    // Router.back 同步返回 void，失败时直接抛异常，此处不再叠加 Promise 链。
    try {
      this.getUIContext().getRouter().back();
    } catch (error) {
      const failure: BusinessError = error as BusinessError;
      Logger.error('catalog back failed, code=' + failure.code + ' message=' + failure.message);
    }
  }

  build() {
    Column() {
      Row() {
        Button($r('app.string.back'))
          .id('nav_back_catalog')
          .fontSize(12)
          .height(28)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.goBack();
          })
        Text($r('app.string.capability_title'))
          .id('catalog_page_title')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 8 })
      }
      .width('100%')
      .margin({ top: 4, bottom: 4 })

      Text($r('app.string.catalog_desc'))
        .id('catalog_page_desc')
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ bottom: 10 })

      List({ space: 8 }) {
        ForEach(this.entries, (item: CatalogEntry) => {
          ListItem() {
            Column() {
              Row() {
                Text(item.group.title)
                  .id('catalog_item_title_' + item.group.key)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor($r('app.color.text_primary'))
                  .layoutWeight(1)
                Text($r('app.string.label_scene_count', item.group.scenes.length))
                  .id('catalog_item_count_' + item.group.key)
                  .fontSize(11)
                  .fontColor($r('app.color.primary'))
              }
              .width('100%')
              Text(item.group.desc)
                .id('catalog_item_desc_' + item.group.key)
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
            .id('catalog_item_' + item.group.key)
            .onClick(() => {
              this.open(item.url);
            })
          }
        }, (item: CatalogEntry) => item.group.key)
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
