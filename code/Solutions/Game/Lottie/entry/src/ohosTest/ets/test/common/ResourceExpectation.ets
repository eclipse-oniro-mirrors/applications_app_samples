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
 * Expected values of the installed application resources. The application
 * ships a Chinese base string set only, so the values below are stable
 * regardless of the test device locale. The three menu entries that exist only
 * in the test resources are handled separately by menuExpectation().
 */

export const APP_STRING_NAMES: Array<string> = [
  'module_desc',
  'EntryAbility_desc',
  'EntryAbility_label',
  'select',
  'play_pause',
  'start_play',
  'speed',
  'play_order',
  'destruction_animation',
  'display_effect',
  'display_effect_this',
  'stop',
  'pause',
  'double_speed',
  'reverse_playback',
  'five_speed',
  'fragment_cycle',
  'play_segments',
  'reset_play',
  'float_integer',
  'cycle',
  'animation_stop',
  'animation_play',
  'refresh_animation',
  'destruction_grunt_animation',
  'playback_position',
  'add_listen',
  'delete_listen',
  'delete_all_Listen',
  'triggers_all_callbacks',
  'listen',
  'select_please',
  'forward',
  'reverse',
  'use_ae_fps'
];

export function expectedAppString(name: string): string {
  switch (name) {
    case 'module_desc':
      return 'Lottie';
    case 'EntryAbility_desc':
      return 'description';
    case 'EntryAbility_label':
      return 'lottie';
    case 'select':
      return '选择动画资源';
    case 'play_pause':
      return '播放/暂停';
    case 'start_play':
      return '开始播放';
    case 'speed':
      return '倍速';
    case 'play_order':
      return '播放顺序';
    case 'destruction_animation':
      return '销毁动画';
    case 'display_effect':
      return '通过name实现对grunt动画展示效果';
    case 'display_effect_this':
      return '通过this实现对grunt动画展示效果';
    case 'stop':
      return '停止';
    case 'pause':
      return '暂停';
    case 'double_speed':
      return '二倍速';
    case 'reverse_playback':
      return '逆序播放';
    case 'five_speed':
      return '五倍速';
    case 'fragment_cycle':
      return '指定片段循环，(20,30)帧';
    case 'play_segments':
      return 'playSegments 片段循环';
    case 'reset_play':
      return '重置播放片段';
    case 'float_integer':
      return '去浮点显示整数';
    case 'cycle':
      return '循环';
    case 'animation_stop':
      return '动画停止';
    case 'animation_play':
      return '动画播放';
    case 'refresh_animation':
      return '刷新动画布局';
    case 'destruction_grunt_animation':
      return '销毁grunt动画';
    case 'playback_position':
      return '播放位置';
    case 'add_listen':
      return '添加侦听事件';
    case 'delete_listen':
      return '删除侦听事件';
    case 'delete_all_Listen':
      return '删除所有侦听事件';
    case 'triggers_all_callbacks':
      return '触发所有已设置的回调';
    case 'listen':
      return '侦听事件';
    case 'select_please':
      return '请选择';
    case 'forward':
      return '正向';
    case 'reverse':
      return '反向';
    case 'use_ae_fps':
      return '使用AE原始帧率播放动画';
    default:
      return '';
  }
}

/**
 * The menu labels live in the test resource module, which carries an English
 * placeholder override. Expected content therefore depends on the runtime
 * language of the device.
 */
export function menuExpectation(name: string, language: string): string {
  const chinese: boolean = language.toLowerCase().indexOf('zh') === 0;
  if (name === 'grunt') {
    return chinese ? 'grunt动画' : 'grunt';
  }
  if (name === 'year') {
    return chinese ? 'year动画' : 'year';
  }
  if (name === 'three_speed') {
    return chinese ? '×3' : 'three_speed';
  }
  return '';
}

export function expectedTestString(name: string): string {
  if (name === 'module_test_desc') {
    return 'test ability description';
  }
  if (name === 'TestAbility_desc') {
    return 'the test ability';
  }
  if (name === 'TestAbility_label') {
    return 'test label';
  }
  return '';
}

// Icon groups keep each case focused on one area of the page.
export const PLAYBACK_ICONS: Array<string> = ['play', 'pause', 'start', 'suspend', 'stop_playing', 'start_stop'];
export const CYCLE_ICONS: Array<string> = ['loop', 'reset', 'subframe'];
export const POSITION_ICONS: Array<string> = ['destination', 'begin', 'refresh', 'destory'];
export const LISTEN_ICONS: Array<string> = ['addevent', 'delete', 'delete_all', 'addall'];
export const MENU_ICONS: Array<string> = ['speed', 'forward', 'ic_public_delete_filled'];
export const APP_ICON_NAMES: Array<string> = ['icon'];

export const ALL_MEDIA_NAMES: Array<string> = [
  'addall',
  'addevent',
  'begin',
  'delete',
  'delete_all',
  'destination',
  'destory',
  'forward',
  'ic_public_delete_filled',
  'icon',
  'loop',
  'pause',
  'play',
  'refresh',
  'reset',
  'speed',
  'start',
  'start_stop',
  'stop_playing',
  'subframe',
  'suspend'
];

export const ICON_EDGE_PX: number = 114;
export const STANDARD_EDGE_PX: number = 200;

export function expectedMediaEdge(name: string): number {
  return name === 'icon' ? ICON_EDGE_PX : STANDARD_EDGE_PX;
}

export function hasPngSignature(bytes: Uint8Array): boolean {
  if (bytes.length < 24) {
    return false;
  }
  return bytes[0] === 0x89 && bytes[1] === 0x50 && bytes[2] === 0x4E && bytes[3] === 0x47 &&
    bytes[4] === 0x0D && bytes[5] === 0x0A && bytes[6] === 0x1A && bytes[7] === 0x0A;
}

export function readPngWidth(bytes: Uint8Array): number {
  return bytes[16] * 16777216 + bytes[17] * 65536 + bytes[18] * 256 + bytes[19];
}

export function readPngHeight(bytes: Uint8Array): number {
  return bytes[20] * 16777216 + bytes[21] * 65536 + bytes[22] * 256 + bytes[23];
}
