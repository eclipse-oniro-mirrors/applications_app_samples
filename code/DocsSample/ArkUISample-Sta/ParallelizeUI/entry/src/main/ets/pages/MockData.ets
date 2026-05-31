'use static'
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

// 颜色常量
export const CARD_RED: string = '#c94b51';
export const CARD_BLUE: string = '#5b97c7';
export const CARD_GREEN: string = '#70c06f';
export const CARD_YELLOW: string = '#cbbb4d';
export const CARD_PURPLE: string = '#ab70b1';

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
