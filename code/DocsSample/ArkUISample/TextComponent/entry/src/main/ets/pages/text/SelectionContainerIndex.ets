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
import { CompletedRoutableCard } from '../../common/Card';
import resource from '../../common/resource';
import { Route } from '../../common/Route';
import { SelectionContainerDemo } from './SelectionContainerDemo';
import { SelectionContainerJoinStyle } from './SelectionContainerJoinStyle';
import { SelectionContainerCustomMenu } from './SelectionContainerCustomMenu';
import { SelectionContainerExtendMenu } from './SelectionContainerExtendMenu';
import { SelectionContainerControllerDemo } from './SelectionContainerControllerDemo';

export const SELECTION_CONTAINER_PREFIX: string = 'text/SelectionContainer';

const selectionContainerRoutes: Route[] = [
  {
    name: `${SELECTION_CONTAINER_PREFIX}/Demo`,
    title: resource.resourceToString($r('app.string.SelectionContainer_Demo')),
    description: $r('app.string.SelectionContainer_Demo_description')
  },
  {
    name: `${SELECTION_CONTAINER_PREFIX}/JoinStyle`,
    title: resource.resourceToString($r('app.string.SelectionContainer_JoinStyle')),
    description: $r('app.string.SelectionContainer_JoinStyle_description')
  },
  {
    name: `${SELECTION_CONTAINER_PREFIX}/CustomMenu`,
    title: resource.resourceToString($r('app.string.SelectionContainer_CustomMenu')),
    description: $r('app.string.SelectionContainer_CustomMenu_description')
  },
  {
    name: `${SELECTION_CONTAINER_PREFIX}/ExtendMenu`,
    title: resource.resourceToString($r('app.string.SelectionContainer_ExtendMenu')),
    description: $r('app.string.SelectionContainer_ExtendMenu_description')
  },
  {
    name: `${SELECTION_CONTAINER_PREFIX}/Controller`,
    title: resource.resourceToString($r('app.string.SelectionContainer_Controller')),
    description: $r('app.string.SelectionContainer_Controller_description')
  }
];

@Builder
export function SelectionContainerDestination(name: string) {
  if (name === selectionContainerRoutes[0].name) {
    SelectionContainerDemo();
  } else if (name === selectionContainerRoutes[1].name) {
    SelectionContainerJoinStyle();
  } else if (name === selectionContainerRoutes[2].name) {
    SelectionContainerCustomMenu();
  } else if (name === selectionContainerRoutes[3].name) {
    SelectionContainerExtendMenu();
  } else if (name === selectionContainerRoutes[4].name) {
    SelectionContainerControllerDemo();
  }
}

@Entry
@Component
struct SelectionContainerIndex {
  @Consume pathStack: NavPathStack;

  build() {
    NavDestination() {
      Scroll() {
        List({ space: 12 }) {
          ForEach(selectionContainerRoutes, (route: Route) => {
            ListItem() {
              CompletedRoutableCard({ title: route.title, description: route.description })
            }
            .width('100%')
            .onClick(() => {
              this.pathStack.pushPath({ name: route.name });
            })
          })
        }
        .contentStartOffset(56)
        .padding({ left: 16, right: 16 })
      }.id('scroll_selection_container')
    }
    .backgroundColor('#f1f3f5')
    .title($r('app.string.SelectionContainer_title'), {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}

export { SelectionContainerIndex };
