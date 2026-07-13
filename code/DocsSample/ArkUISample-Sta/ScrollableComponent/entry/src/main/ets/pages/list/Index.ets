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

import { AddListItem } from './AddListItem';
import { CompletedRoutableCard } from '../../common/Card';
import { ControlledScrollPositionList } from './ControlledScrollPositionList';
import { CustomListStyle } from './CustomListStyle';
import { DataInList } from './DataInList';
import { DeleteListItem } from './DeleteListItem';
import { GroupedList } from './GroupedList';
import { ListIteration } from './ListIteration';
import { ListLayout } from './ListLayout';
import { ResponsiveScrollPositionList } from './ResponsiveScrollPositionList';
import { Route } from '../../common/Route';
import { StickyHeaderList } from './StickyHeaderList';
import { SwipeListItem } from './SwipeableListItem';
import { TaggedListItems } from './TaggedListItems';
import { CollapseAndExpand } from './CollapseAndExpand';
import { LongList } from './LongList';
import { ListChatRoom } from './ListChatRoom';
import { SupportSlidingHand } from './SupportSlidingHand';
import { ListSwipeSelect } from './ListSwipeSelect';
import resource from '../../common/resource';

import {
  Entry,
  Component,
  Builder,
  Column,
  List,
  ListItem,
  Text,
  ForEach,
  NavDestination,
  BarStyle,
  BlurStyle,
  ResourceStr,
  Resource,
  NavPathStack,
  NavPathInfo,
  ListOptions,
  $r
} from '@kit.ArkUI';
import { Consume } from '@ohos.arkui.stateManagement';

export const List_ROUTE_PREFIX: string = 'list';

const routes: Route[] = [
  new Route(
    'list/ListLayout',
    resource.resourceToString($r('app.string.ListLayout_title')),
    $r('app.string.ListLayout_description')
  ),
  new Route(
    'list/DataInList',
    resource.resourceToString($r('app.string.DataInList_title')),
    $r('app.string.DataInList_description')
  ),
  new Route(
    'list/ListIteration',
    resource.resourceToString($r('app.string.ListIteration_title')),
    $r('app.string.ListIteration_description')
  ),
  new Route(
    'list/CustomListStyle',
    resource.resourceToString($r('app.string.CustomListStyle_title')),
    $r('app.string.CustomListStyle_description')
  ),
  new Route(
    'list/GroupedList',
    resource.resourceToString($r('app.string.GroupedList_title')),
    $r('app.string.GroupedList_description')
  ),
  new Route(
    'list/StickyHeaderList',
    resource.resourceToString($r('app.string.StickyHeaderList_title')),
    $r('app.string.StickyHeaderList_description')
  ),
  new Route(
    'list/ControlledScrollPositionList',
    resource.resourceToString($r('app.string.ControlledScrollPositionList_title')),
    $r('app.string.ControlledScrollPositionList_description')
  ),
  new Route(
    'list/ResponsiveScrollPositionList',
    resource.resourceToString($r('app.string.ResponsiveScrollPositionList_title')),
    $r('app.string.ResponsiveScrollPositionList_description')
  ),
  new Route(
    'list/SwipeListItem',
    resource.resourceToString($r('app.string.SwipeListItem_title')),
    $r('app.string.SwipeListItem_description')
  ),
  new Route(
    'list/TaggedListItems',
    resource.resourceToString($r('app.string.TaggedListItems_title')),
    $r('app.string.TaggedListItems_description')
  ),
  new Route(
    'list/AddListItem',
    resource.resourceToString($r('app.string.AddListItem_title')),
    $r('app.string.AddListItem_description')
  ),
  new Route(
    'list/DeleteListItem',
    resource.resourceToString($r('app.string.DeleteListItem_title')),
    $r('app.string.DeleteListItem_description')
  ),
  new Route(
    'list/LongList',
    resource.resourceToString($r('app.string.LongList_title')),
    $r('app.string.LongList_description')
  ),
  new Route(
    'list/CollapseAndExpand',
    resource.resourceToString($r('app.string.CollapseAndExpand_title')),
    $r('app.string.CollapseAndExpand_description')
  ),
  new Route(
    'list/ListChatRoom',
    resource.resourceToString($r('app.string.ListChatRoom_title')),
    $r('app.string.ListChatRoom_description')
  ),
  new Route(
    'list/SupportSlidingHand',
    resource.resourceToString($r('app.string.Support_Sliding_Hand_Event')),
    $r('app.string.Sliding_Hand_Event')
  ),
  new Route(
    'list/ListSwipeSelect',
    resource.resourceToString($r('app.string.ListSwipeSelect_title')),
    $r('app.string.ListSwipeSelect_description')
  )
];

@Builder
export function listDestination(name: string): void {
  if (name === List_ROUTE_PREFIX) {
    ListExample();
  } else if (name === routes[0].name) {
    ListLayout();
  } else if (name === routes[1].name) {
    DataInList();
  } else if (name === routes[2].name) {
    ListIteration();
  } else if (name === routes[3].name) {
    CustomListStyle();
  } else if (name === routes[4].name) {
    GroupedList();
  } else if (name === routes[5].name) {
    StickyHeaderList();
  } else if (name === routes[6].name) {
    ControlledScrollPositionList();
  } else if (name === routes[7].name) {
    ResponsiveScrollPositionList();
  } else if (name === routes[8].name) {
    SwipeListItem();
  } else if (name === routes[9].name) {
    TaggedListItems();
  } else if (name === routes[10].name) {
    AddListItem();
  } else if (name === routes[11].name) {
    DeleteListItem();
  } else if (name === routes[12].name) {
    LongList();
  } else if (name === routes[13].name) {
    CollapseAndExpand();
  } else if (name === routes[14].name) {
    ListChatRoom();
  } else if (name === routes[15].name) {
    SupportSlidingHand()
  } else if (name === routes[16].name) {
    ListSwipeSelect();
  }
}

@Entry
@Component
struct ListExample {
  @Consume pathStack: NavPathStack;

  build(): void {
    NavDestination() {
      List({ space: 12 } as ListOptions) {
        ForEach(routes, (route: Route) => {
          ListItem() {
            CompletedRoutableCard({ title: route.title, description: route.description as ResourceStr })
          }
          .width('100%')
          .onClick(() => {
        this.pathStack.pushPath(new NavPathInfo(route.name, undefined));
            console.log(route.name +'点击滑动离手事件')
          })
        })
      }
      .contentStartOffset(56)
      .padding({ left: 16, right: 16 })
    }
    .backgroundColor('#f1f3f5')
    .title('List', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
  }
}
