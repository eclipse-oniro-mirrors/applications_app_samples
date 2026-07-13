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

export interface ServiceItemInfo {
  name: string;
  backgroundImageSrc: string;
  describeInfo: string;
  iconSrc: string;
  iconColor: string;
}

export interface AppItemInfo {
  name: string;
  iconSrc: string;
  iconColor: string;
}

export interface AppCardInfo {
  name: string;
  items: AppItemInfo[];
}

export interface ServiceCardInfo {
  name: string;
  items: ServiceItemInfo[];
}

export interface CardInfo {
  type: string;
  serviceCardInfo?: ServiceCardInfo;
  appCardInfo?: AppCardInfo;
}

export const CARD_RED: string = '#C94B51';
export const CARD_BLUE: string = '#5B97C7';
export const CARD_GREEN: string = '#70C06F';
export const CARD_YELLOW: string = '#CBBB4D';
export const CARD_PURPLE: string = '#AB70B1';

export const appItems: AppItemInfo[] = [
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_PURPLE },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE }
];

export const serviceItems: ServiceItemInfo[] = [
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_PURPLE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本 ', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_BLUE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_RED },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_PURPLE },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_GREEN },
  { name: '测试文本', backgroundImageSrc: 'resource://media/startIcon.png', describeInfo: '测试文本 测试文本', iconSrc: 'resource://media/startIcon.png', iconColor: CARD_YELLOW }
];

export const cardTypeInfos1: CardInfo[] = [
  { type: 'App', appCardInfo: { name: '测试文本1', items: appItems } },
  { type: 'Service', serviceCardInfo: { name: '测试文本2', items: serviceItems } },
  { type: 'App', appCardInfo: { name: '测试文本3', items: appItems } },
];

export const cardTypeInfos2: CardInfo[] = [
  { type: 'App', appCardInfo: { name: '测试文本4', items: appItems } },
];
