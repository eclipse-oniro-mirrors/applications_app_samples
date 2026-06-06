'use static'

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

// [Start styledStringSceneExample_start]
import {
  $r,
  Button,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  DecorationStyle,
  Entry,
  FontWeight,
  LengthMetrics,
  MutableStyledString,
  NavDestination,
  ParagraphStyle,
  Row,
  StyledStringKey,
  Text,
  TextAlign,
  TextController,
  TextDecorationType,
  TextStyle,
  LineHeightStyle
} from '@kit.ArkUI';
import { ComponentCard } from '../../common/Card';
import resourceToStringManager from '../../common/resource';

@Entry
@Component
export struct StyledStringSceneExample {
  alignCenterParagraphStyleAttr: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Center });
  // 行高样式对象
  lineHeightStyle1: LineHeightStyle = new LineHeightStyle(LengthMetrics.vp(24));
  // Bold样式
  boldTextStyle: TextStyle = new TextStyle({ fontWeight: FontWeight.Bold });
  // 创建含段落样式的对象paragraphStyledString1
  // 请将$r('app.string.StyledStringSceneExample_Text_1')替换为实际资源文件，在本示例中该资源文件的value值为"您的豪华钻石已过期1天\n续费可继续享受会员专属权益"
  paragraphStyledString1: MutableStyledString =
    new MutableStyledString(this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.StyledStringSceneExample_Text_1').id), [
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.alignCenterParagraphStyleAttr
      },
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: new LineHeightStyle(LengthMetrics.vp(40))
      },
      {
        start: 11,
        length: 14,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(14), fontColor: Color.Grey })
      },
      {
        start: 11,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.alignCenterParagraphStyleAttr
      },
      {
        start: 11,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: this.lineHeightStyle1
      }
    ]);
  // 请将$r('app.string.StyledStringSceneExample_Text_2')替换为实际资源文件，在本示例中该资源文件的value值为"\n￥4.88￥15"
  paragraphStyledString2: MutableStyledString =
    new MutableStyledString(this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.StyledStringSceneExample_Text_2').id), [
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.alignCenterParagraphStyleAttr
      },
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: new LineHeightStyle(LengthMetrics.vp(60))
      },
      {
        start: 0,
        length: 6,
        styledKey: StyledStringKey.FONT,
        styledValue: this.boldTextStyle
      },
      {
        start: 1,
        length: 1,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(18) })
      },
      {
        start: 2,
        length: 4,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(40) })
      },
      {
        start: 6,
        length: 3,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Grey, fontSize: LengthMetrics.vp(14) })
      },
      {
        start: 6,
        length: 3,
        styledKey: StyledStringKey.DECORATION,
        styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Grey })
      }
    ]);
  // 请将$r('app.string.StyledStringSceneExample_Text_3')替换为实际资源文件，在本示例中该资源文件的value值为"\n02时06分后将失去该优惠"
  paragraphStyledString3: MutableStyledString =
    new MutableStyledString(this.getUIContext()
      .getHostContext()!.resourceManager.getStringSync($r('app.string.StyledStringSceneExample_Text_3').id), [
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.alignCenterParagraphStyleAttr
      },
      {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.LINE_HEIGHT,
        styledValue: new LineHeightStyle(LengthMetrics.vp(30))
      },
      {
        start: 1,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: '#FFD700', fontWeight: FontWeight.Bold })
      },
      {
        start: 4,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: '#FFD700', fontWeight: FontWeight.Bold })
      }
    ]);
  controller: TextController = new TextController();

  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        // [StartExclude styledStringSceneExample_start]
        // 请将$r('app.string.StyledStringSceneExample_title')替换为实际资源文件，在本示例中该资源文件的value值为"场景示例"
        ComponentCard({ title: $r('app.string.StyledStringSceneExample_title') }) {
          // [EndExclude styledStringSceneExample_start]
          Row() {
            Column({ space: 5 } as ColumnOptions) {
              Text(undefined, { controller: this.controller })
                .id('text1')
                .width(240)
                .copyOption(CopyOptions.InApp)
                .draggable(true)
                .onAppear(() => {
                  this.paragraphStyledString2.appendStyledString(this.paragraphStyledString3);
                  this.paragraphStyledString1.appendStyledString(this.paragraphStyledString2);
                  this.controller.setStyledString(this.paragraphStyledString1);
                })
              // 请将$r('app.string.StyledStringSceneExample_Button_1')替换为实际资源文件，在本示例中该资源文件的value值为"限时4.88元 立即续费"
              Button($r('app.string.StyledStringSceneExample_Button_1'))
                .width(200)
                .fontColor(Color.White)
                .fontSize(18)
                .backgroundColor('#3CB371')
                .margin({ bottom: 10 })
            }
            .borderWidth(1).borderColor('#FFDEAD')
            .margin({ left: 10 })
          }
          .height('60%')
        }

        // [StartExclude styledStringSceneExample_start]
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
      // [EndExclude styledStringSceneExample_start]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.StyledStringSceneExample_title')替换为实际资源文件，在本示例中该资源文件的value值为"场景示例"
    .title($r('app.string.StyledStringSceneExample_title'))
  }
}
// [End styledStringSceneExample_start]
