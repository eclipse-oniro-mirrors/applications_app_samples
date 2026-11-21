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
/**
* Shared constants of the PublishMultimediaUpdate device test suite.
* Every component id, visible text and fixture value used by more than one
* suite is declared once here, so that a layout change needs one edit.
*/
export const BUNDLE_NAME: string = 'com.samples.publishmultimediaupdate';
export const MODULE_NAME: string = 'entry';
export const ABILITY_NAME: string = 'EntryAbility';
export const BUNDLE: string = 'PublishMultimedia_';
export const TAG: string = '[Sample_PublishMultimediaUpdate]';
export const DOMAIN: number = 0xF811;
// UI settle budgets, in milliseconds.
export const SETTLE_PAGE: number = 800;
export const POLL_INTERVAL: number = 100;
export const TIMEOUT_LAUNCH: number = 5000;
// Ability lifecycle states reported by AbilityDelegator.getAbilityState.
export const STATE_FOREGROUND: number = 2;
export const LEGAL_ABILITY_STATES: Array<number> = [0, 1, 2, 3, 4, 5];
// Component ids declared in the page, dialog and menu builders.
// Literal text rendered by the page; the base resource set is Chinese only,
// therefore these values are locale independent on the device under test.
export class PageText {
  static readonly PUBLISH: string = '发布';
  static readonly TAKE_PHOTO: string = '拍照';
  static readonly RECORD_VIDEO: string = '拍摄';
  static readonly ALERT_ACCEPT: string = '知道了';
  static readonly FOLLOWING: string = 'Following';
  static readonly FOR_YOU: string = 'For You';
  static readonly TOOLBAR_HOME: string = 'Home';
  static readonly TOOLBAR_DISCOVER: string = 'Discover';
  static readonly TOOLBAR_GROUP: string = 'Super Group';
  static readonly TOOLBAR_MESSAGE: string = 'Message';
  static readonly TOOLBAR_MORE: string = 'more';
  static readonly STUB_TOAST: string = '仅演示，可自行实现业务功能';
  static readonly INPUT_COMMENT: string = '请输入评论内容';
  static readonly INPUT_IMAGE: string = '请选择图片';
  static readonly INPUT_VIDEO: string = '请选择视频';
  static readonly OWNER: string = String.fromCharCode(25105, 30340);
}
// Dialog types used by the page state machine.
export const TYPE_TEXT: string = 'text';
export const TYPE_IMAGE: string = 'image';
export const TYPE_VIDEO: string = 'video';
// Lazy list tuning declared on the page.
// Facts of model/mockdata.ets: the seven seed moments, in insertion order.
export const MOCK_COUNT: number = 7;
export const MOCK_IDS: Array<string> = ['0', '1', '2', '3', '4', '5', '6'];
export const MOCK_USER_NAMES: Array<string> = [
  'Zoologist',
  'Scientist',
  'Engineer',
  'Architect',
  'IT Engineer',
  'Artist',
  'Chef'
];
export const MOCK_TEXTS: Array<string> = [
  '好可爱的小鸟啊',
  '今天研究个大火箭',
  '又要熬夜画图纸了',
  '看看' + String.fromCharCode(25105) + '新设计的大楼',
  '电脑怎么又死机了',
  '作画',
  '来杯香槟'
];
// Image property is assigned for every seed row; rows 2 and 6 carry an empty
// string because their media slot is used by a video instead.
export const MOCK_IMAGE_ASSIGNED: Array<boolean> = [true, true, true, true, true, true, true];
export const MOCK_VIDEO_ROWS: Array<number> = [2, 6];
export const MOCK_IMAGE_ROWS: Array<number> = [0, 1, 3, 4, 5];
// Facts of constants/ListConstants.ets.
export const LIST_LAYOUT_WEIGHT: number = 1;
export const LIST_SPACE: number = 10;
// Facts of utils/Logger.ets.
export const LOGGER_FORMAT: string = '%{public}s, %{public}s';
// Facts of the entry module manifest.
export const ENTRY_MAIN_ELEMENT: string = 'EntryAbility';
export const SETTLE_UI: number = 300;
export const SETTLE_MENU: number = 500;
export const SETTLE_DIALOG: number = 800;
export const TIMEOUT_TEXT: number = 3000;
export const TIMEOUT_MENU: number = 2000;
export const ID_ADD_BUTTON: string = 'add_button';
export const ID_MENU_POST: string = 'Post';
export const ID_SELECT_PICTURE: string = 'select_picture_button';
export const ID_SELECT_VIDEO: string = 'select_video_button';
export const ID_TEXT_INPUT: string = 'id_text_input';
export const ID_TEXT_PUBLISH: string = 'id_text_publish';
