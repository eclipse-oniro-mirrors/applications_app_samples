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
 * Shared constants for the Lottie device test suite.
 * Everything the suite uses to address the page under test is declared here so
 * that a layout change only needs one edit instead of a search across files.
 */

export const BUNDLE_NAME: string = 'ohos.samples.lottie';
export const MODULE_NAME: string = 'entry';
export const ABILITY_NAME: string = 'EntryAbility';
export const TEST_ABILITY_NAME: string = 'TestAbility';

export const BUNDLE: string = 'Lottie_';
export const TAG: string = '[Sample_Lottie]';
export const DOMAIN: number = 0xF811;

export const SETTLE_PAGE: number = 1500;
export const SETTLE_UI: number = 300;
export const POLL_INTERVAL: number = 200;
export const TIMEOUT_TEXT: number = 3000;
export const TIMEOUT_LAUNCH: number = 5000;
export const TIMEOUT_MENU: number = 2000;

export const STATE_FOREGROUND: number = 2;
export const STATE_BACKGROUND: number = 3;
export const LEGAL_ABILITY_STATES: Array<number> = [0, 1, 2, 3, 4];

// Component ids declared in pages/Lottie.ets
export const ID_SELECT_ANIMATION: string = 'selectAnimationBtn';
export const ID_PLAY: string = 'play';
export const ID_SUSPEND: string = 'suspend';
export const ID_PAUSE: string = 'pause';
export const ID_START_PLAY: string = 'startPlay';
export const ID_SPEED: string = 'speed';
export const ID_PLAY_ORDER: string = 'playOrder';
export const ID_DESTROY_ANIMATION: string = 'destroyAnimation';
export const ID_STOP_BY_NAME: string = 'stop';

export const CONTROL_IDS: Array<string> = [
  ID_PLAY,
  ID_SUSPEND,
  ID_PAUSE,
  ID_START_PLAY,
  ID_SPEED,
  ID_PLAY_ORDER,
  ID_DESTROY_ANIMATION
];

// Two canvases, both declared as 540px x 360px in the page.
export const CANVAS_WIDTH_PX: number = 540;
export const CANVAS_HEIGHT_PX: number = 360;
export const CANVAS_COUNT: number = 2;
export const TAB_COUNT: number = 5;

// The vertical tab bar is 100px wide and sits at the left edge of the page.
export const TAB_BAR_MAX_LEFT: number = 200;
export const TAB_BAR_MAX_WIDTH: number = 200;
export const TAB_BAR_MAX_HEIGHT: number = 400;
export const TAB_CONTENT_MAX_OFFSET: number = 320;

export const TAB_INDEX_PLAY_PAUSE: number = 0;
export const TAB_INDEX_THIS: number = 1;
export const TAB_INDEX_CYCLE: number = 2;
export const TAB_INDEX_POSITION: number = 3;
export const TAB_INDEX_LISTEN: number = 4;

/**
 * Visible text of the page. The application resources only ship a Chinese base
 * set, so these literals are locale independent on the device under test.
 * Values that double as resource names (grunt/year/three speed) exist only in
 * the test resources and are selected here by their rendered Chinese form.
 */
export class UiText {
  static readonly PAGE_TITLE: string = '选择动画资源';
  static readonly PLACEHOLDER: string = '请选择';
  static readonly GRUNT: string = 'grunt';
  static readonly YEAR: string = 'year';

  static readonly MENU_GRUNT: string = 'grunt动画';
  static readonly MENU_YEAR: string = 'year动画';

  static readonly SPEED_ONE: string = '×1';
  static readonly SPEED_TWO: string = '×2';
  static readonly SPEED_THREE: string = '×3';

  static readonly DIRECTION_FORWARD: string = '正向';
  static readonly DIRECTION_REVERSE: string = '反向';

  static readonly RESET_IMMEDIATE: string = '即时生效播放';
  static readonly RESET_DEFERRED: string = '延迟到下轮循环播放再生效';

  static readonly STOP_AT_FRAME: string = '250帧时停止';
  static readonly STOP_AT_TIME: string = '5000ms时停止';
  static readonly PLAY_FROM_FRAME: string = '从250帧开始播放';
  static readonly PLAY_FROM_TIME: string = '从12000ms开始播放';

  static readonly TAB_PLAY_PAUSE: string = '播放/暂停';
  static readonly TAB_CYCLE: string = '循环';
  static readonly TAB_POSITION: string = '播放位置';
  static readonly TAB_LISTEN: string = '侦听事件';

  static readonly CONTENT_BY_NAME: string = '通过name实现对grunt动画展示效果';
  static readonly CONTENT_BY_THIS: string = '通过this实现对grunt动画展示效果';
  static readonly CONTENT_CYCLE: string = '指定片段循环，(20,30)帧';
  static readonly CONTENT_POSITION: string = '动画停止';
  static readonly CONTENT_LISTEN: string = '添加侦听事件';

  static readonly LABEL_STOP: string = '停止';
  static readonly LABEL_PAUSE: string = '暂停';
  static readonly LABEL_START: string = '开始播放';
  static readonly LABEL_SPEED: string = '倍速';
  static readonly LABEL_ORDER: string = '播放顺序';
  static readonly LABEL_DESTROY: string = '销毁动画';
  static readonly LABEL_DOUBLE_SPEED: string = '二倍速';
  static readonly LABEL_FIVE_SPEED: string = '五倍速';
  static readonly LABEL_REVERSE: string = '逆序播放';
  static readonly LABEL_SEGMENT: string = '指定片段循环，(20,30)帧';
  static readonly LABEL_PLAY_SEGMENTS: string = 'playSegments 片段循环';
  static readonly LABEL_RESET_SEGMENT: string = '重置播放片段';
  static readonly LABEL_SUBFRAME: string = '去浮点显示整数';
  static readonly LABEL_ANIMATION_STOP: string = '动画停止';
  static readonly LABEL_ANIMATION_PLAY: string = '动画播放';
  static readonly LABEL_RESIZE: string = '刷新动画布局';
  static readonly LABEL_DESTROY_GRUNT: string = '销毁grunt动画';
  static readonly LABEL_ADD_LISTEN: string = '添加侦听事件';
  static readonly LABEL_DELETE_LISTEN: string = '删除侦听事件';
  static readonly LABEL_PAUSE_ALL: string = '触发所有已设置的回调';
  static readonly LABEL_DELETE_ALL_LISTEN: string = '删除所有侦听事件';

  static readonly TOAST_AE_FPS: string = '使用AE原始帧率播放动画';
  static readonly TOAST_LOOP: string = 'grunt loopComplete';
}

/**
 * Page title identifiers used by each suite to prove that the expected page is
 * still on top after an interaction.
 */
export class SuiteTag {
  static readonly ABILITY: string = '[Sample_Lottie_Ability]';
  static readonly LIFECYCLE: string = '[Sample_Lottie_Lifecycle]';
  static readonly LAYOUT: string = '[Sample_Lottie_Layout]';
  static readonly SELECT: string = '[Sample_Lottie_Select]';
  static readonly PLAYBACK: string = '[Sample_Lottie_Playback]';
  static readonly SPEED: string = '[Sample_Lottie_Speed]';
  static readonly SEGMENT: string = '[Sample_Lottie_Segment]';
  static readonly POSITION: string = '[Sample_Lottie_Position]';
  static readonly LISTEN: string = '[Sample_Lottie_Listen]';
  static readonly TABS: string = '[Sample_Lottie_Tabs]';
  static readonly RESOURCE: string = '[Sample_Lottie_Resource]';
  static readonly MEDIA: string = '[Sample_Lottie_Media]';
  static readonly BUNDLE_INFO: string = '[Sample_Lottie_Bundle]';
  static readonly DISPLAY: string = '[Sample_Lottie_Display]';
  static readonly LOGGER: string = '[Sample_Lottie_Logger]';
  static readonly PERFORMANCE: string = '[Sample_Lottie_Performance]';
  static readonly ERROR: string = '[Sample_Lottie_Error]';
  static readonly ANIMATION: string = '[Sample_Lottie_Animation]';
  static readonly DEVICE: string = '[Sample_Lottie_Device]';
  static readonly I18N: string = '[Sample_Lottie_I18n]';
  static readonly RUNTIME: string = '[Sample_Lottie_Runtime]';
  static readonly URI: string = '[Sample_Lottie_Uri]';
  static readonly COLLECTIONS: string = '[Sample_Lottie_Collections]';
  static readonly BUFFER: string = '[Sample_Lottie_Buffer]';
  static readonly FILE_IO: string = '[Sample_Lottie_FileIo]';
  static readonly PREFERENCES: string = '[Sample_Lottie_Preferences]';
  static readonly URL: string = '[Sample_Lottie_Url]';
  static readonly ERROR_MATRIX: string = '[Sample_Lottie_ErrorMatrix]';
}
