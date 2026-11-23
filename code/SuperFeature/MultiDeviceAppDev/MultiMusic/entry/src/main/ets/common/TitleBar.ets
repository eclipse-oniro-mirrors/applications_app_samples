/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { BreakpointConstants, TitleBarConstants } from './Constants';

@Component
export default struct TitleBar {
  @LocalStorageProp('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.MD;

  @Builder
  TitleIcon(imageSrc: Resource) {
    Column() {
      Image(imageSrc).height(TitleBarConstants.ICON_SIZE).width(TitleBarConstants.ICON_SIZE)
    }
    .alignItems(HorizontalAlign.End)
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(TitleBarConstants.ICON_AREA_HEIGHT)
  }

  build() {
    GridRow({
      columns: {
        sm: TitleBarConstants.GRID_COLUMNS_SM,
        md: TitleBarConstants.GRID_COLUMNS_MD,
        lg: TitleBarConstants.GRID_COLUMNS_LG
      }
    }) {
      // Title
      GridCol({
        span: {
          sm: TitleBarConstants.TITLE_SPAN_SM,
          md: TitleBarConstants.TITLE_SPAN_MD,
          lg: TitleBarConstants.TITLE_SPAN_LG
        },
        order: {
          sm: TitleBarConstants.TITLE_ORDER_SM,
          md: TitleBarConstants.TITLE_ORDER_MD,
          lg: TitleBarConstants.TITLE_ORDER_LG
        }
      }) {
        Text($r('app.string.recommend'))
          .width('100%')
          .lineHeight(TitleBarConstants.TITLE_LINE_HEIGHT)
          .height(TitleBarConstants.ICON_AREA_HEIGHT)
          .fontSize(TitleBarConstants.TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
      }

      // Search component
      GridCol({
        span: {
          sm: TitleBarConstants.SEARCH_SPAN_SM,
          md: TitleBarConstants.SEARCH_SPAN_MD,
          lg: TitleBarConstants.SEARCH_SPAN_LG
        },
        order: {
          sm: TitleBarConstants.SEARCH_ORDER_SM,
          md: TitleBarConstants.SEARCH_ORDER_MD,
          lg: TitleBarConstants.SEARCH_ORDER_LG
        }
      }) {
        Search({ placeholder: $r('app.string.search_placeholder') })
          .height(TitleBarConstants.SEARCH_HEIGHT)
          .backgroundColor($r('app.color.common_white'))
          .enableKeyboardOnFocus(false)
      }.height(TitleBarConstants.SEARCH_AREA_HEIGHT)

      // More icon
      GridCol({
        span: { sm: TitleBarConstants.ICON_SPAN, md: TitleBarConstants.ICON_SPAN, lg: TitleBarConstants.ICON_SPAN },
        order: {
          sm: TitleBarConstants.ACTION_ORDER_SM,
          md: TitleBarConstants.ACTION_ORDER_MD,
          lg: TitleBarConstants.ACTION_ORDER_LG
        }
      }) {
        this.TitleIcon($r('app.media.ic_more'))
      }

      // Listener icon
      GridCol({
        span: { sm: TitleBarConstants.ICON_SPAN, md: TitleBarConstants.ICON_SPAN, lg: TitleBarConstants.ICON_SPAN },
        order: {
          sm: TitleBarConstants.LISTENER_ORDER_SM,
          md: TitleBarConstants.LISTENER_ORDER_MD,
          lg: TitleBarConstants.LISTENER_ORDER_LG
        }
      }) {
        this.TitleIcon($r('app.media.ic_listener'))
      }
    }
  }
}
