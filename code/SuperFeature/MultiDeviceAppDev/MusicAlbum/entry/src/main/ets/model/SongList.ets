/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { SongItem } from './SongModule'

export interface OptionItem {
  image: Resource,
  text: ResourceStr
}

const songList: SongItem[] = [
  { id: 1, title: $r('app.string.song_title_01'),
    singer: $r('app.string.song_singer_01'), label: $r('app.media.ic_vip') },
  { id: 2, title: $r('app.string.song_title_02'),
    singer: $r('app.string.song_singer_02'), label: $r('app.media.ic_SQ') },
  { id: 3, title: $r('app.string.song_title_03'),
    singer: $r('app.string.song_singer_03'), label: $r('app.media.ic_SQ') },
  { id: 4, title: $r('app.string.song_title_04'),
    singer: $r('app.string.song_singer_04'), label: $r('app.media.ic_SQ') },
  { id: 5, title: $r('app.string.song_title_05'),
    singer: $r('app.string.song_singer_05'), label: $r('app.media.ic_SQ') },
  { id: 6, title: $r('app.string.song_title_06'),
    singer: $r('app.string.song_singer_06'), label: $r('app.media.ic_SQ') },
  { id: 7, title: $r('app.string.song_title_07'),
    singer: $r('app.string.song_singer_07'), label: $r('app.media.ic_SQ') },
  { id: 8, title: $r('app.string.song_title_08'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 9, title: $r('app.string.song_title_09'),
    singer: $r('app.string.song_singer_06'), label: $r('app.media.ic_SQ') },
  { id: 10, title: $r('app.string.song_title_08'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 11, title: $r('app.string.song_title_10'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 12, title: $r('app.string.song_title_01'),
    singer: $r('app.string.song_singer_01'), label: $r('app.media.ic_vip') },
  { id: 13, title: $r('app.string.song_title_02'),
    singer: $r('app.string.song_singer_02'), label: $r('app.media.ic_SQ') },
  { id: 14, title: $r('app.string.song_title_03'),
    singer: $r('app.string.song_singer_03'), label: $r('app.media.ic_SQ') },
  { id: 15, title: $r('app.string.song_title_04'),
    singer: $r('app.string.song_singer_04'), label: $r('app.media.ic_SQ') },
  { id: 16, title: $r('app.string.song_title_05'),
    singer: $r('app.string.song_singer_05'), label: $r('app.media.ic_SQ') },
  { id: 17, title: $r('app.string.song_title_06'),
    singer: $r('app.string.song_singer_06'), label: $r('app.media.ic_SQ') },
  { id: 18, title: $r('app.string.song_title_07'),
    singer: $r('app.string.song_singer_07'), label: $r('app.media.ic_SQ') },
  { id: 19, title: $r('app.string.song_title_08'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 20, title: $r('app.string.song_title_09'),
    singer: $r('app.string.song_singer_06'), label: $r('app.media.ic_SQ') },
  { id: 21, title: $r('app.string.song_title_08'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 23, title: $r('app.string.song_title_10'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 24, title: $r('app.string.song_title_08'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') },
  { id: 25, title: $r('app.string.song_title_10'),
    singer: $r('app.string.song_singer_08'), label: $r('app.media.ic_SQ') }
]
const optionList: OptionItem[] = [
  { image: $r('app.media.ic_collect'), text: '999+' },
  { image: $r('app.media.ic_download'), text: $r('app.string.download') },
  { image: $r('app.media.icon_comments'), text: $r('app.string.comment') },
  { image: $r('app.media.icon_share'), text: $r('app.string.share') }
]

export { songList, optionList }