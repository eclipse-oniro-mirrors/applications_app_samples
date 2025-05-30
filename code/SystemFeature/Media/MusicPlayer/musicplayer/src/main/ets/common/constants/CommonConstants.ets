/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { MusicInfo } from '../../model/MusicModel';

/**
 * 通用常量
 */
export default class CommonConstants {
  /**
   * 歌曲列表数据
   */
  static readonly MUSIC_INFO_ARR: Array<MusicInfo> = [
    {
      title: '鸿蒙天空NO.1',
      cover: 'cover_first.webp',
      singer: '九州客',
      duration: 133000,
      res: 'music.mp3',
      lrcRes: 'lyrics.lrc',
    } as MusicInfo,
    {
      title: '鸿蒙天空NO.2',
      cover: 'cover_second.webp',
      singer: '九州客',
      duration: 133000,
      res: 'music.mp3',
      lrcRes: 'lyrics.lrc',
    } as MusicInfo,
    {
      title: '鸿蒙天空NO.3',
      cover: 'cover_third.webp',
      singer: '九州客',
      duration: 133000,
      res: 'music.mp3',
      lrcRes: 'lyrics.lrc',
    } as MusicInfo
  ]

  /**
   * FolderStack组件中，需要在折叠态下移动到上屏的组件id
   */
  static readonly FOLDER_STACK_UP_COMP_ID = 'folderStackUpperSubComp';
  /**
   * 1分钟内的秒数
   */
  static readonly SECONDS_IN_MINUTE = 60;
  /**
   * 1小时内的秒数
   */
  static readonly SECONDS_IN_HOUR = 3600;
  /**
   * avplayer闲置状态
   */
  static readonly AVPLAYER_STATE_IDLE = 'idle';
  /**
   * avplayer资源初始化状态
   */
  static readonly AVPLAYER_STATE_INITIALIZED = 'initialized';
  /**
   * avplayer已准备状态
   */
  static readonly AVPLAYER_STATE_PREPARED = 'prepared';
  /**
   * avplayer正在播放状态
   */
  static readonly AVPLAYER_STATE_PLAYING = 'playing';
  /**
   * avplayer暂停状态
   */
  static readonly AVPLAYER_STATE_PAUSED = 'paused';
  /**
   * avplayer播放至结尾状态
   */
  static readonly AVPLAYER_STATE_COMPLETED = 'completed';
  /**
   * avplayer停止状态
   */
  static readonly AVPLAYER_STATE_STOPPED = 'stopped';
  /**
   * avplayer销毁状态
   */
  static readonly AVPLAYER_STATE_RELEASED = 'released';
  /**
   * avplayer错误状态
   */
  static readonly AVPLAYER_STATE_ERROR = 'error';
  /**
   * 音乐播放器控制按钮尺寸（普通）
   */
  static readonly MUSIC_PLAYER_CTRL_BTN_SIZE_COMMON = 30;
  /**
   * 音乐播放器控制按钮尺寸（大）
   */
  static readonly MUSIC_PLAYER_CTRL_BTN_SIZE_BIG = 50;
  /**
   * 歌曲封面图尺寸（折叠屏展开态）
   */
  static readonly MUSIC_COVER_SIZE_EXPANDED = 300;
  /**
   * 歌曲封面图尺寸（折叠屏半折叠态）
   */
  static readonly MUSIC_COVER_SIZE_HALF_FOLDED = 200;
  /**
   * 歌曲封面图尺寸（折叠屏折叠态或者非折叠屏）
   */
  static readonly MUSIC_COVER_SIZE_COMMON = 150;
  /**
   * 歌曲时间显示文本展示最大行数
   */
  static readonly MUSIC_TIME_MAX_LINES = 1;
  /**
   * 歌曲时间显示文本flex布局所占父组件尺寸的比例
   */
  static readonly MUSIC_TIME_FLEX_SHRINK = 0;
  /**
   * 歌曲控制按钮flex布局所占父组件尺寸的比例
   */
  static readonly MUSIC_CTRL_BTN_FLEX_SHRINK = 1;
  /**
   * 歌曲信息组件高度（折叠屏半折叠态）
   */
  static readonly MUSIC_INFO_COMP_HEIGHT_HALF_FOLDED = '100%';
  /**
   * 歌曲信息组件高度（折叠屏其他状态）
   */
  static readonly MUSIC_INFO_COMP_HEIGHT_COMMON = '90%';
  /**
   * 歌曲歌词组件高度（折叠屏展开态）
   */
  static readonly MUSIC_LYRICS_COMP_HEIGHT_EXPANDED = '300vp';
  /**
   * 歌曲歌词组件高度（折叠屏半折叠态）
   */
  static readonly MUSIC_LYRICS_COMP_HEIGHT_HALF_FOLDED = '200vp';
  /**
   * 歌曲歌词组件高度（折叠屏折叠态或者非折叠屏）
   */
  static readonly MUSIC_LYRICS_COMP_HEIGHT_COMMON = '30%';
  /**
   * 歌曲歌词组件上外边距（折叠屏折叠态或非折叠屏）
   */
  static readonly MUSIC_LYRICS_COMP_MARGIN_TOP_COMMON = 0;
  /**
   * 歌曲歌词组件上外边距（折叠屏半折叠态或展开态）
   */
  static readonly MUSIC_LYRICS_COMP_MARGIN_TOP_EXPANDED = 100;
  /**
   * 歌曲进度条最小值
   */
  static readonly MUSIC_SLIDER_MIN = 0;
  /**
   * 歌曲进度条最大值
   */
  static readonly MUSIC_SLIDER_MAX = 100;
  /**
   * 导航条
   */
  static readonly MUSIC_DURATION = 400;
  /**
   * 歌曲封面资源图宽度
   */
  static readonly MUSIC_MEDIA_IMAGE_WIDTH = 370;
  /**
   * 歌曲封面资源图高度
   */
  static readonly MUSIC_MEDIA_IMAGE_HEIGHT = 349;

  /**
   * 播放模式总数（顺序、单曲循环、列表循环、随机）
   */
  static readonly LOOP_MODE_TOTAL_NUM = 4;
}

