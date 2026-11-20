'use static';

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

import { Comment } from '../../../../main/ets/pages/model/CommentModel';
import { expect } from '@ohos/hypium';

// Deterministic fixtures for the CameraSample comment feed. Every helper is
// side-effect free so suites can share them without ordering constraints.

export const AVATAR_LOGO_ONE: string = 'app.media.icon_comment_app_logo1';
export const AVATAR_LOGO_TWO: string = 'app.media.icon_comment_app_logo2';
export const AVATAR_FALLBACK: string = 'app.media.startIcon';

export const IMAGE_LANDSCAPE: string = 'app.media.icon_comment_landscape1';
export const IMAGE_ADVERT: string = 'app.media.icon_comment_launch_advert';
export const IMAGE_CAMERA: string = 'app.media.icon_comment_camera';
export const IMAGE_CAPTURE_PREFIX: string = 'file://media/Photo/';
export const IMAGE_CAPTURE_SAMPLE: string = 'file://media/Photo/2026/01/12/IMG_0001.jpg';

export const NAME_CLOUD: string = 'Cloud';
export const NAME_LIHUA: string = 'LiHua';
export const NAME_GUEST: string = 'Guest';

export const TIME_MORNING: string = '02-07 13:25';
export const TIME_EVENING: string = '2026-0-1 18:5';
export const TIME_EMPTY: string = '';

export const SAMPLE_COMMENT_TEXT: string = 'The scenery here is beautiful';
export const SAMPLE_COMMENT_UNICODE: string = '\u8fd9\u91cc\u98ce\u666f\u5f88\u597d';
export const SAMPLE_COMMENT_EMOJI: string = 'Nice shot \u{1F4F7}';
export const SAMPLE_COMMENT_LONG: string =
  'A very long comment used by workload suites to exercise repeated string operations without ' +
  'depending on platform specific locale behaviour. It stays deterministic across devices.';

export const FIELD_COUNT: number = 6;

/**
 * Draft handed to the publish pipeline. It mirrors the @State values that
 * CommentInputAndCameraCapture keeps before the publish button is pressed.
 */
export class CommentDraft {
  name: string = '';
  content: string = '';
  avatar: string = '';
  time: string = '';
  images: string[] = [];

  constructor(
    name: string = '', content: string = '', avatar: string = '',
    time: string = '', images: string[] = []
  ) {
    this.name = name;
    this.content = content;
    this.avatar = avatar;
    this.time = time;
    this.images = images.slice();
  }
}

/** Immutable projection used by snapshot and equality suites. */
export class CommentSnapshot {
  id: number = 0;
  name: string = '';
  content: string = '';
  avatar: string = '';
  time: string = '';
  images: string[] = [];
}

export function makeComment(
  id: number, name: string, content: string, avatar: string, time: string, images: string[]
): Comment {
  const comment: Comment = new Comment();
  comment.id = id;
  comment.name = name;
  comment.comment = content;
  comment.avatar = avatar;
  comment.time = time;
  comment.images = [...images];
  return comment;
}

/** Fixture with index-driven values; index is 1 based for published items. */
export function makeSimpleComment(index: number): Comment {
  return makeComment(
    index,
    'user_' + index,
    'comment body ' + index,
    index % 2 === 0 ? AVATAR_LOGO_TWO : AVATAR_LOGO_ONE,
    '02-07 13:' + padNumber(index % 60, 2),
    index % 3 === 0 ? [IMAGE_LANDSCAPE, IMAGE_ADVERT] : new Array<string>()
  );
}

export function makeDraft(index: number): CommentDraft {
  return new CommentDraft(
    'draft_user_' + index,
    'draft body ' + index,
    index % 2 === 0 ? AVATAR_LOGO_TWO : AVATAR_LOGO_ONE,
    '2026-01-' + padNumber(index % 28 + 1, 2) + ' 09:' + padNumber(index % 60, 2),
    [IMAGE_CAPTURE_PREFIX + index + '/IMG_' + padNumber(index, 4) + '.jpg']
  );
}

export function makeCaptureDraft(index: number, content: string): CommentDraft {
  return new CommentDraft(
    NAME_LIHUA,
    content,
    AVATAR_LOGO_TWO,
    '2026-01-12 09:' + padNumber(index % 60, 2),
    [IMAGE_CAPTURE_PREFIX + index + '/IMG_' + padNumber(index, 4) + '.jpg']
  );
}

export function cloneComment(source: Comment): Comment {
  return makeComment(
    source.id, source.name, commentText(source), commentAvatar(source),
    source.time, commentImages(source)
  );
}

export function commentImages(source: Comment): string[] {
  const result: string[] = [];
  for (let index = 0; index < source.images.length; index++) {
    result.push(source.images[index] as string);
  }
  return result;
}

export function commentText(source: Comment): string {
  return source.comment as string;
}

export function commentAvatar(source: Comment): string {
  return source.avatar as string;
}

export function withCommentText(source: Comment, text: string): Comment {
  const copy: Comment = cloneComment(source);
  copy.comment = text;
  return copy;
}

export function withImages(source: Comment, images: string[]): Comment {
  const copy: Comment = cloneComment(source);
  copy.images = [...images];
  return copy;
}

export function makeFeed(count: number): Comment[] {
  const items: Comment[] = [];
  for (let index = 0; index < count; index++) {
    items.push(makeSimpleComment(index + 1));
  }
  return items;
}

export function makeDraftFeed(count: number): CommentDraft[] {
  const drafts: CommentDraft[] = [];
  for (let index = 1; index <= count; index++) {
    drafts.push(makeDraft(index));
  }
  return drafts;
}

export function makeCaptureFeed(count: number): CommentDraft[] {
  const drafts: CommentDraft[] = [];
  for (let index = 1; index <= count; index++) {
    drafts.push(makeCaptureDraft(index, 'capture comment ' + index));
  }
  return drafts;
}

export function padNumber(value: number, width: number): string {
  let text: string = String(value);
  while (text.length < width) {
    text = '0' + text;
  }
  return text;
}

export function repeatText(text: string, times: number): string {
  let result: string = '';
  for (let index = 0; index < times; index++) {
    result += text;
  }
  return result;
}

/** Deterministic mixed text of the requested length. */
export function makeText(seed: number, length: number): string {
  const alphabet: string = 'abcdefghijklmnopqrstuvwxyz0123456789 ';
  let result: string = '';
  let state: number = seed * 2654435761 % 2147483647;
  for (let index = 0; index < length; index++) {
    state = state * 48271 % 2147483647;
    result += alphabet.charAt((state % alphabet.length).toInt());
  }
  return result;
}

export function snapshotComment(source: Comment): CommentSnapshot {
  const snapshot: CommentSnapshot = new CommentSnapshot();
  snapshot.id = source.id;
  snapshot.name = source.name;
  snapshot.content = commentText(source);
  snapshot.avatar = commentAvatar(source);
  snapshot.time = source.time;
  snapshot.images = commentImages(source);
  return snapshot;
}

export function sameSnapshot(left: CommentSnapshot, right: CommentSnapshot): boolean {
  return left.id === right.id &&
    left.name === right.name &&
    left.content === right.content &&
    left.avatar === right.avatar &&
    left.time === right.time &&
    sameStrings(left.images, right.images);
}

export function sameStrings(left: string[], right: string[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

export function sameComments(left: Comment[], right: Comment[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

export function feedNames(items: Comment[]): string[] {
  const names: string[] = [];
  for (let index = 0; index < items.length; index++) {
    names.push(items[index].name);
  }
  return names;
}

export function feedIds(items: Comment[]): number[] {
  const ids: number[] = [];
  for (let index = 0; index < items.length; index++) {
    ids.push(items[index].id);
  }
  return ids;
}

export function feedTimes(items: Comment[]): string[] {
  const times: string[] = [];
  for (let index = 0; index < items.length; index++) {
    times.push(items[index].time);
  }
  return times;
}

export function feedImageCounts(items: Comment[]): number[] {
  const counts: number[] = [];
  for (let index = 0; index < items.length; index++) {
    counts.push(items[index].images.length);
  }
  return counts;
}

export function totalImageCount(items: Comment[]): number {
  let total: number = 0;
  for (let index = 0; index < items.length; index++) {
    total += items[index].images.length;
  }
  return total;
}

export function indexOfName(items: Comment[], name: string): number {
  for (let index = 0; index < items.length; index++) {
    if (items[index].name === name) {
      return index;
    }
  }
  return -1;
}

export function indexOfId(items: Comment[], id: number): number {
  for (let index = 0; index < items.length; index++) {
    if (items[index].id === id) {
      return index;
    }
  }
  return -1;
}

export function assertCommentMatches(
  actual: Comment, id: number, name: string, content: string, imageCount: number
): void {
  expect(actual.id).assertEqual(id);
  expect(actual.name).assertEqual(name);
  expect(commentText(actual)).assertEqual(content);
  expect(actual.images.length).assertEqual(imageCount);
  expect(actual.time.length >= 0).assertTrue();
}

export function assertImagesMatch(actual: Comment, expected: string[]): void {
  expect(actual.images.length).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(actual.images[index] as string).assertEqual(expected[index]);
  }
}

export function assertFeedMatches(actual: Comment[], expected: Comment[]): void {
  expect(actual.length).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(actual[index].id).assertEqual(expected[index].id);
    expect(actual[index].name).assertEqual(expected[index].name);
    expect(commentText(actual[index])).assertEqual(commentText(expected[index]));
    expect(actual[index].images.length).assertEqual(expected[index].images.length);
  }
}

export function imageUriFor(index: number): string {
  return IMAGE_CAPTURE_PREFIX + '2026/01/' + padNumber(index, 2) + '/IMG_' +
    padNumber(index, 4) + '.jpg';
}

export function imageUriBatch(count: number): string[] {
  const uris: string[] = [];
  for (let index = 0; index < count; index++) {
    uris.push(imageUriFor(index));
  }
  return uris;
}
