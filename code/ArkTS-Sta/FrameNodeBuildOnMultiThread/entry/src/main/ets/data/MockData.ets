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

'use static'

import { ServiceItemInfo, AppItemInfo, CardInfo } from '../models/CardInfo'
import { $r } from '@kit.ArkUI'

const CARD_RED: string = '#ffc94b51';
const CARD_BLUE: string = '#ff5b97c7';
const CARD_GREEN: string = '#ff70c06f';
const CARD_YELLOW: string = '#ffcbbb4d';
const CARD_PURPLE: string = '#ffab70b1';

const SERVICE_ITEM_INFOS: Array<ServiceItemInfo> = [
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_YELLOW
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_RED
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_PURPLE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_BLUE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_GREEN
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_BLUE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_YELLOW
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_BLUE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_RED
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_YELLOW
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_GREEN
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_BLUE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_YELLOW
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_BLUE
  },
  {
    name: '测试文本',
    backgroundImageSrc: $r('app.media.startIcon'),
    describeInfo: '测试文本 测试文本',
    iconSrc: $r('app.media.startIcon'),
    iconColor: CARD_RED
  },
]

const APP_ITEM_INFOS: Array<AppItemInfo> = [
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_RED },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_RED },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_RED },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_RED },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: $r('app.media.startIcon'), iconColor: CARD_RED },
]

export const CARD_INFOS: Array<CardInfo> = [
  { type: 'App', appCardInfo: { name: '测试文本1', items: APP_ITEM_INFOS } },
  { type: 'Service', serviceCardInfo: { name: '测试文本2', items: SERVICE_ITEM_INFOS } },
  { type: 'App', appCardInfo: { name: '测试文本3', items: APP_ITEM_INFOS } },
  { type: 'App', appCardInfo: { name: '测试文本4', items: APP_ITEM_INFOS } },
  { type: 'Service', serviceCardInfo: { name: '测试文本5', items: SERVICE_ITEM_INFOS } },
  { type: 'App', appCardInfo: { name: '测试文本6', items: APP_ITEM_INFOS } },
]