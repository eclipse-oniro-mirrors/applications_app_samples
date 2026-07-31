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

import curves from '@ohos.curves';
import { Route, RouteGroup } from './common/Index';
import { common } from '@kit.AbilityKit';
import {
  $r, Entry, Component, State, Builder, Column, Text, List, ListItemGroup,
  ListItem, Row, Blank, Image, TransitionEffect, NavPathStack, Padding,
  CustomStyles, CommonMethod, Color, FontWeight, ForEach, Curve, AnimateParam,
  ListItemGroupOptions, VerticalAlign
} from '@kit.ArkUI';

const cardPressedStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0.1)').opacity(1);
}

const cardNormalStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)').opacity(1);
}

const cardDisabledStyle: CustomStyles = (instance: CommonMethod): void => {
  instance.backgroundColor('rgba(0,0,0,0)').opacity(0.5);
}

@Entry
@Component
struct AnimateIndex {
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  @State router: NavPathStack = new NavPathStack();
  @State routes: Array<RouteGroup> = new Array<RouteGroup>(
    {
      name: "animatableProperty",
      // $r("app.string.animatableProperty_label")需要替换为开发者所需的资源文件
      label: $r("app.string.animatableProperty_label"),
      children:[
        // $r("app.string.component_temp_label1")需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r("app.string.animatableProperty_temp_label1") },
        { name: 'template2/Index', label: $r("app.string.animatableProperty_temp_label2") },
      ]
    }, {
      name: "animation",
      // $r('app.string.animation_label')需要替换为开发者所需的资源文件
      label: $r('app.string.animation_label'),
      children:[
        // $r('app.string.temp1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.temp1') },
        { name: 'template2/Index', label: $r('app.string.animation_temp_label2') },
        { name: 'template3/Index', label: $r('app.string.animation_temp_label3') },
        { name: 'template4/Index', label: $r('app.string.animation_temp_label4') }
      ]
    }, {
      name: "animationBlur",
      label: $r("app.string.animation_blur_label"),
      children:[
        { name: 'template1/BlurEffectsExample', label: $r("app.string.animation_blur_label1") },
        { name: 'template2/Index', label: $r("app.string.animation_blur_label2") },
        { name: 'template3/BackDropBlurStyleDemo', label: $r("app.string.animation_blur_label3") },
        { name: 'template4/ForegroundBlurStyleDemo', label: $r("app.string.animation_blur_label4") },
        { name: 'template5/MotionBlurTest', label: $r("app.string.animation_blur_label5") }
      ]
    }, {
      name: "animator",
      // $r('app.string.animator_label')需要替换为开发者所需的资源文件
      label: $r('app.string.animator_label'),
      children:[
        // $r('app.string.animator_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r("app.string.animator_temp_label1") },
        { name: 'template2/Index', label: $r("app.string.animator_temp_label2") },
        { name: 'template3/Index', label: $r("app.string.animator_temp_label3") },
        { name: 'template4/Index', label: $r("app.string.animator_temp_label4") }
      ]
    }, {
      name: "cohesion",
      // $r('app.string.cohesion_label')需要替换为开发者所需的资源文件
      label: $r('app.string.cohesion_label'),
      children:[
        //  $r('app.string.cohesion_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.cohesion_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.cohesion_temp_label2') }
      ]
    }, {
      name: "component",
      // $r('app.string.component_label')需要替换为开发者所需的资源文件
      label: $r('app.string.component_label'),
      children:[
        // $r('app.string.component_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.component_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.component_temp_label2') },
        { name: 'template3/Index', label: $r('app.string.component_temp_label3') },
      ]
    }, {
      name: "compTransition",
      // $r('app.string.compTransition_label')需要替换为开发者所需的资源文件
      label: $r('app.string.compTransition_label'),
      children:[
        // $r('app.string.compTransition_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.compTransition_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.compTransition_temp_label2') },
        { name: 'template3/Index', label: $r('app.string.compTransition_temp_label3') },
        { name: 'template4/Index', label: $r('app.string.compTransition_temp_label4') },
        { name: 'template5/Index', label: $r('app.string.compTransition_temp_label5') },
        { name: 'template6/Index', label: $r('app.string.compTransition_temp_label6') }
      ]
    }, {
      name: "modalTransition",
      label: $r("app.string.modal_transition_label"),
      children: [
        { name: 'template1/BindContentCoverDemo', label: $r("app.string.modal_transition_label1") },
        { name: 'template2/BindSheetDemo', label: $r("app.string.modal_transition_label2") },
        { name: 'template3/BindMenuDemo', label: $r("app.string.modal_transition_label3") },
        { name: 'template4/BindContextMenuDemo', label: $r("app.string.modal_transition_label4") },
        { name: 'template5/BindPopupDemo', label: $r("app.string.modal_transition_label5") },
        { name: 'template6/ModalTransitionWithIf', label: $r("app.string.modal_transition_label6") }
      ]
    }, {
      name: "pageTransition",
      // $r('app.string.pageTransition_label')需要替换为开发者所需的资源文件
      label: $r('app.string.pageTransition_label'),
      children:[
        //  $r('app.string.pageTransition_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.pageTransition_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.pageTransition_temp_label2') },
        { name: 'template3/pageTransitionSrc1', label: $r('app.string.pageTransition_temp_label3') },
        { name: 'template4/pageTransitionSrc2', label: $r('app.string.pageTransition_temp_label4') },
        { name: 'template5/PageTransitionSrc3', label: $r("app.string.pageTransition_temp_label5") },
        { name: 'template6/PageTransitionSrc4', label: $r("app.string.pageTransition_temp_label6") }
      ]
    }, {
      name: "particle",
      // $r('app.string.particle_label')需要替换为开发者所需的资源文件
      label: $r('app.string.particle_label'),
      children:[
        // $r('app.string.particle_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.particle_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.particle_temp_label2') },
        { name: 'template3/Index', label: $r('app.string.particle_temp_label3') },
        { name: 'template4/Index', label: $r('app.string.particle_temp_label4') },
        { name: 'template5/Index', label: $r('app.string.particle_temp_label5') },
        { name: 'template6/Index', label: $r('app.string.particle_temp_label6') }
      ]
    }, {
      name: "rotation",
      // $r('app.string.rotation_label')需要替换为开发者所需的资源文件
      label: $r('app.string.rotation_label'),
      children:[
        // $r('app.string.rotation_temp_label1')需要替换为开发者所需的资源文件
        { name: 'template1/Index', label: $r('app.string.rotation_temp_label1') },
        { name: 'template2/Index', label: $r('app.string.rotation_temp_label2') }
      ]
    }, {
      name: "shareTransition",
      // $r('app.string.shareTransition_label')需要替换为开发者所需的资源文件
      label: $r('app.string.shareTransition_label'),
      children:[
        { name: 'template1/Index', label: $r("app.string.shareTransition_label1") },
        { name: 'template2/Index', label: $r("app.string.shareTransition_label2") },
        { name: 'template3/Index', label: $r("app.string.shareTransition_label3") },
        { name: 'template4/Index', label: $r("app.string.shareTransition_label4") },
        { name: 'template5/Index', label: $r("app.string.shareTransition_label5") },
        { name: 'template6/IfElseGeometryTransition', label: $r("app.string.shareTransition_label6") },
        { name: 'template7/Index', label: $r("app.string.shareTransition_label7") }
      ]
    }, {
      name: "springCurve",
      label: $r("app.string.springCurve_label"),
      children:[
        { name: 'template1/SpringCurve', label: $r("app.string.temp1") }
      ]
    }, {
      name: "traditionalCurve",
      label: $r("app.string.traditionalCurve_label"),
      children:[
        { name: 'template1/CurveDemo', label: $r("app.string.temp1") }
      ]
    }
  );
  @State selection: string | null = null;

  @Builder
  ListItemGroupHeader(route: RouteGroup): void {
    Row() {
      Text(route.label)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
        .fontWeight(FontWeight.Medium)

      Blank()

      Text(`${route.children.length}`)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
        .opacity(this.selection === route.name ? 0 : 1)

      Image($r('sys.media.ohos_ic_public_arrow_right'))
        .fillColor($r('sys.color.ohos_id_color_fourth'))
        .height(24)
        .width(24)
        .rotate({ angle: this.selection === route.name ? 90 : 0 })
        .animation({ curve: curves.interpolatingSpring(0, 1, 228, 30) })
    }
    .borderRadius(20)
    .width('100%')
    .padding({ top: 8, bottom: 8, left: 8, right: 8 } as Padding)
    .enabled(!!route.children.length)
    .stateStyles({
      pressed: cardPressedStyle,
      normal: cardNormalStyle,
      disabled: cardDisabledStyle,
    })
    .onClick(() => {
      this.getUIContext().animateTo(
        { curve: curves.interpolatingSpring(0, 1, 228, 25) } as AnimateParam,
        () => {
          if (this.selection === route.name) {
            this.selection = null;
          } else {
            this.selection = route.name;
          }
        }
      );
    })
  }

  build(): void {
    Column() {
      Text($r('app.string.AnimateIndex'))
      List() {
        ForEach(this.routes, (routeGroup: RouteGroup) => {
          ListItemGroup({ header: () => { this.ListItemGroupHeader(routeGroup) } } as ListItemGroupOptions) {
            if (routeGroup.name === this.selection) {
              ForEach(routeGroup.children, (route: Route) => {
                ListItem() {
                  Row() {
                    Text(route.label).fontSize(16)
                    Blank()
                    Image($r('sys.media.ohos_ic_public_arrow_right'))
                      .fillColor($r('sys.color.ohos_id_color_fourth'))
                      .height(24)
                      .width(24)
                  }
                  .stateStyles({
                    pressed: cardPressedStyle,
                    normal: cardNormalStyle,
                    disabled: cardDisabledStyle,
                  })
                  .borderRadius(20)
                  .padding(8)
                  .transition(
                    TransitionEffect.OPACITY.animation({
                      curve: curves.interpolatingSpring(0, 1, 228, 30)
                    })
                  )
                  .width('100%')
                  .onClick(() => {
                    let name: string = `pages/${routeGroup.name}/${route.name}`;
                    this.getUIContext().getRouter().pushUrl({ url: name });
                  })
                }
                .width('100%')
              })
            }
          }
          .padding({ top: 2, bottom: 2, left: 2, right: 2 } as Padding)
          .divider({ strokeWidth: 0.5 })
        })
      }.padding({ bottom: 10 } as Padding)
    }
  }
}