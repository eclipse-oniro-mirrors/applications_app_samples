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

interface DepthSampleItem {
  name: Resource;
  description: Resource;
  page: string;
}

@Entry
@Component
struct Index {
  private samples: DepthSampleItem[] = [
    {
      name: $r('app.string.depth_2d_name'),
      description: $r('app.string.depth_2d_desc'),
      page: 'pages/DepthComponent_2D'
    },
    {
      name: $r('app.string.depth_3d_name'),
      description: $r('app.string.depth_3d_desc'),
      page: 'pages/DepthComponent_3D'
    },
    {
      name: $r('app.string.depth_ndc_name'),
      description: $r('app.string.depth_ndc_desc'),
      page: 'pages/DepthComponent_NDC'
    },
    {
      name: $r('app.string.depth_only_name'),
      description: $r('app.string.depth_only_desc'),
      page: 'pages/DepthComponent_Depth'
    },
    {
      name: $r('app.string.depth_crop_name'),
      description: $r('app.string.depth_crop_desc'),
      page: 'pages/DepthComponent_Crop'
    }
  ];

  build() {
    Navigation() {
      List({ space: 12 }) {
        ForEach(this.samples, (item: DepthSampleItem) => {
          ListItem() {
            Row({ space: 12 }) {
              Text(item.name)
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
                .fontColor('#182431')
                .maxLines(1)
              Text(item.description)
                .fontSize(14)
                .fontColor('#666666')
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .layoutWeight(1)
              Text('>')
                .fontSize(20)
                .fontColor('#999999')
            }
            .width('100%')
            .padding(16)
            .borderRadius(12)
            .backgroundColor('#FFFFFF')
            .onClick(() => {
              router.pushUrl({ url: item.page });
            })
          }
        }, (item: DepthSampleItem) => item.page)
      }
      .width('100%')
      .height('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 12 })
      .backgroundColor('#F1F3F5')
    }
    .title($r('app.string.depth_index_title'))
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
  }
}
