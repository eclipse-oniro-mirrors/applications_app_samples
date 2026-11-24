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

import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
/**
* Builders for the model fixtures used by the suite.
* Plain strings stand in for ResourceStr values: the model treats both forms
* as opaque identifiers, and a string keeps the expectation readable.
*/
export const DEFAULT_AVATAR: string = 'avatar_default_uri';
export const EMPTY_RESOURCE: string = '';
export const OWNER_NAME: string = String.fromCharCode(25105, 30340);
export const MOMENT_ID_PREFIX: string = 'moment_';
/**
* Moment with the three required fields only.
*/
export function buildMoment(id: string, userName: string, text: string): FriendMoment {
  return new FriendMoment(id, userName, DEFAULT_AVATAR, text);
}
/**
* Moment whose image slot is assigned.
*/
export function buildImageMoment(id: string, userName: string, text: string, image: ResourceStr): FriendMoment {
  return new FriendMoment(id, userName, DEFAULT_AVATAR, text, image);
}
/**
* Moment whose video slot is assigned through the sixth constructor argument.
*/
export function buildVideoMoment(id: string, userName: string, text: string, video: ResourceStr): FriendMoment {
  return new FriendMoment(id, userName, DEFAULT_AVATAR, text, EMPTY_RESOURCE, video);
}
/**
* Moment with both media slots assigned.
*/
export function buildFullMoment(id: string, userName: string, text: string, image: ResourceStr, video: ResourceStr): FriendMoment {
  return new FriendMoment(id, userName, DEFAULT_AVATAR, text, image, video);
}
/**
* Ordered batch of text moments; ids and texts derive from the prefix so that a
* failure names the offending row.
*/
export function buildMoments(count: number, prefix: string): Array<FriendMoment> {
  let list: Array<FriendMoment> = [];
  for (let index: number = 0; index < count; index++) {
    list.push(new FriendMoment(prefix + index, 'user_' + prefix + index, DEFAULT_AVATAR, 'text_' + prefix + index));
  }
  return list;
}
/**
* Concatenation helper; String.repeat is not available on every API level of
* the supported range, so the loop keeps the helper portable.
*/
export function repeatText(value: string, times: number): string {
  let result: string = '';
  for (let index: number = 0; index < times; index++) {
    result += value;
  }
  return result;
}
/**
* Text of an exact length, built by repeating a filler and trimming the tail.
*/
export function textOfLength(length: number, filler: string): string {
  if (length <= 0) {
    return '';
  }
  let result: string = '';
  while (result.length < length) {
    result += filler;
  }
  return result.substring(0, length);
}
