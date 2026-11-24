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
import { Constants } from '../../../../main/ets/pages/constants/Constants';
import {
  CommentDraft, commentImages, commentText, makeComment, padNumber
} from './Fixtures';

// Behaviour extracted from the CameraSample UI components so that it can be
// exercised without a device. Every routine keeps the same observable contract
// as CommentInputAndCameraCapture.ets and Index.ets.

/** Mirrors the Want built by cameraCapture(). */
export class CameraParameters {
  supportMultiMode: boolean = false;
  callBundleName: string = '';
}

export class CameraRequest {
  action: string = '';
  parameters: CameraParameters = new CameraParameters();
}

export function buildCameraRequest(bundleName: string): CameraRequest {
  const request: CameraRequest = new CameraRequest();
  request.action = Constants.ACTION_PICKER_CAMERA;
  request.parameters.supportMultiMode = false;
  request.parameters.callBundleName = bundleName;
  return request;
}

/**
 * Result passed to startAbilityForResult callback. errorCode mirrors the
 * BusinessError code, resultCode mirrors AbilityResult.resultCode.
 */
export class CaptureOutcome {
  errorCode: number = 0;
  resultCode: number = 0;
  hasParameters: boolean = true;
  resourceUri: string = '';
  message: string = '';

  constructor(errorCode: number = 0, resultCode: number = 0,
    hasParameters: boolean = true, resourceUri: string = '', message: string = '') {
    this.errorCode = errorCode;
    this.resultCode = resultCode;
    this.hasParameters = hasParameters;
    this.resourceUri = resourceUri;
    this.message = message;
  }
}

export function captureSucceeded(outcome: CaptureOutcome): boolean {
  return outcome.errorCode === 0 && outcome.resultCode === 0;
}

/** Reads result.want.parameters[Constants.KEY_RESULT_PICKER_CAMERA]. */
export function extractResourceUri(outcome: CaptureOutcome): string {
  if (!captureSucceeded(outcome) || !outcome.hasParameters) {
    return '';
  }
  return outcome.resourceUri;
}

/** Mirrors getCurrentDate() in CommentInputAndCameraCapture.ets. */
export function formatCommentTime(date: Date): string {
  return date.getFullYear() + '-' + date.getMonth() + '-' + date.getDay() + ' ' +
    date.getHours() + ':' + date.getMinutes();
}

export function formatCommentTimeAt(
  year: number, month: number, day: number, hour: number, minute: number
): string {
  return formatCommentTime(new Date(year.toInt(), month.toInt(), day.toInt(), hour.toInt(), minute.toInt(), 0, 0));
}

/** The publish button is gated only by imagePath !== ''. */
export function publishEligible(imagePath: string): boolean {
  return imagePath !== '';
}

export function draftEligible(draft: CommentDraft): boolean {
  return draft.images.length > 0 && publishEligible(draft.images[0]);
}

/** Builds the Comment that the publish click handler appends. */
export function createPublishedComment(draft: CommentDraft): Comment | undefined {
  if (!draftEligible(draft)) {
    return undefined;
  }
  const comment: Comment = new Comment();
  comment.name = draft.name;
  comment.comment = draft.content;
  comment.avatar = draft.avatar;
  comment.time = draft.time;
  comment.images = [...draft.images];
  return comment;
}

/** this.items = [...this.items, mockData] keeps the previous array intact. */
export function appendImmutable(items: Comment[], item: Comment): Comment[] {
  const result: Comment[] = [];
  for (let index = 0; index < items.length; index++) {
    result.push(items[index]);
  }
  result.push(item);
  return result;
}

/** ForEach key generator used by ImageListView.ets. */
export function imageGridKey(index: number): string {
  return index.toString();
}

export function imageGridKeys(count: number): string[] {
  const keys: string[] = [];
  for (let index = 0; index < count; index++) {
    keys.push(imageGridKey(index));
  }
  return keys;
}

/** Trims nothing: the component stores the raw TextInput payload. */
export function normalizeResourceUri(uri: string): string {
  return uri;
}

export function isResourceUri(uri: string): boolean {
  return uri.startsWith('file://') || uri.startsWith('datashare://');
}

export function isMediaUri(uri: string): boolean {
  return uri.startsWith('file://media/');
}

export class TextInputState {
  value: string = '';
  updates: number = 0;

  constructor(initial: string = '') {
    this.value = initial;
  }

  update(text: string): void {
    this.value = normalizeResourceUri(text);
    this.updates++;
  }

  reset(): void {
    this.value = '';
  }

  length(): number {
    return this.value.length;
  }

  isEmpty(): boolean {
    return this.value === '';
  }

  trimmed(): string {
    return this.value.trim();
  }

  contains(text: string): boolean {
    return this.value.indexOf(text) !== -1;
  }

  preview(maxLength: number): string {
    if (this.value.length <= maxLength) {
      return this.value;
    }
    return this.value.substring(0, maxLength.toInt()) + '...';
  }
}

/** Matches the @State imagePath lifecycle of the input component. */
export class CaptureState {
  imagePath: string = '';
  captures: number = 0;
  resets: number = 0;

  onCaptureResult(outcome: CaptureOutcome): boolean {
    if (!captureSucceeded(outcome)) {
      return false;
    }
    const uri: string = extractResourceUri(outcome);
    if (uri === '') {
      return false;
    }
    this.imagePath = uri;
    this.captures++;
    return true;
  }

  canPublish(): boolean {
    return publishEligible(this.imagePath);
  }

  consume(): string {
    const uri: string = this.imagePath;
    this.imagePath = '';
    this.resets++;
    return uri;
  }

  peek(): string {
    return this.imagePath;
  }
}

/** Ordered journal backed by a plain array, mimicking @State commentList. */
export class CommentJournal {
  private items: Comment[] = [];
  private nextId: number = 1;

  constructor(seed: Comment[] = []) {
    for (let index = 0; index < seed.length; index++) {
      this.items.push(seed[index]);
    }
  }

  size(): number {
    return this.items.length;
  }

  at(index: number): Comment {
    if (index < 0 || index >= this.items.length) {
      throw new Error('journal index out of range: ' + index);
    }
    return this.items[index.toInt()];
  }

  tryAt(index: number): Comment | undefined {
    if (index < 0 || index >= this.items.length) {
      return undefined;
    }
    return this.items[index.toInt()];
  }

  first(): Comment | undefined {
    return this.items.length === 0 ? undefined : this.items[0];
  }

  latest(): Comment | undefined {
    return this.items.length === 0 ? undefined : this.items[this.items.length - 1];
  }

  snapshot(): Comment[] {
    const copy: Comment[] = [];
    for (let index = 0; index < this.items.length; index++) {
      copy.push(this.items[index]);
    }
    return copy;
  }

  append(comment: Comment): number {
    if (comment.id <= 0) {
      comment.id = this.nextId;
    }
    this.items.push(comment);
    if (comment.id >= this.nextId) {
      this.nextId = comment.id + 1;
    }
    return this.items.length;
  }

  appendDraft(draft: CommentDraft): Comment | undefined {
    const comment: Comment | undefined = createPublishedComment(draft);
    if (comment === undefined) {
      return undefined;
    }
    this.append(comment);
    return comment;
  }

  removeLast(): Comment | undefined {
    if (this.items.length === 0) {
      return undefined;
    }
    return this.items.pop();
  }

  clear(): void {
    this.items = [];
  }

  indexOfId(id: number): number {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].id === id) {
        return index;
      }
    }
    return -1;
  }

  countByName(name: string): number {
    let count: number = 0;
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].name === name) {
        count++;
      }
    }
    return count;
  }

  names(): string[] {
    const names: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      names.push(this.items[index].name);
    }
    return names;
  }

  texts(): string[] {
    const texts: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      texts.push(commentText(this.items[index]));
    }
    return texts;
  }

  ids(): number[] {
    const ids: number[] = [];
    for (let index = 0; index < this.items.length; index++) {
      ids.push(this.items[index].id);
    }
    return ids;
  }

  imageCounts(): number[] {
    const counts: number[] = [];
    for (let index = 0; index < this.items.length; index++) {
      counts.push(this.items[index].images.length);
    }
    return counts;
  }

  totalImages(): number {
    let total: number = 0;
    for (let index = 0; index < this.items.length; index++) {
      total += this.items[index].images.length;
    }
    return total;
  }

  allImages(): string[] {
    const images: string[] = [];
    for (let index = 0; index < this.items.length; index++) {
      const current: string[] = commentImages(this.items[index]);
      for (let imageIndex = 0; imageIndex < current.length; imageIndex++) {
        images.push(current[imageIndex]);
      }
    }
    return images;
  }

  withImagesOnly(): Comment[] {
    const result: Comment[] = [];
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].images.length > 0) {
        result.push(this.items[index]);
      }
    }
    return result;
  }

  findByName(name: string): Comment | undefined {
    for (let index = 0; index < this.items.length; index++) {
      if (this.items[index].name === name) {
        return this.items[index];
      }
    }
    return undefined;
  }

  replaceAt(index: number, comment: Comment): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items[index.toInt()] = comment;
    return true;
  }

  joinTexts(separator: string): string {
    let result: string = '';
    for (let index = 0; index < this.items.length; index++) {
      if (index > 0) {
        result += separator;
      }
      result += commentText(this.items[index]);
    }
    return result;
  }
}

/**
 * Deterministic line based codec for drafts. Layout:
 * name|avatar|time|content|uri1,uri2
 * Values containing the separators are rejected by decode.
 */
export class DraftCodec {
  static readonly FIELD_SEPARATOR: string = '|';
  static readonly IMAGE_SEPARATOR: string = ',';

  encode(draft: CommentDraft): string {
    return draft.name + DraftCodec.FIELD_SEPARATOR + draft.avatar +
      DraftCodec.FIELD_SEPARATOR + draft.time + DraftCodec.FIELD_SEPARATOR +
      draft.content + DraftCodec.FIELD_SEPARATOR + draft.images.join(DraftCodec.IMAGE_SEPARATOR);
  }

  decode(payload: string): CommentDraft | undefined {
    if (payload === '') {
      return undefined;
    }
    const parts: string[] = payload.split(DraftCodec.FIELD_SEPARATOR);
    if (parts.length !== 5) {
      return undefined;
    }
    const images: string[] = parts[4] === '' ? [] :
      parts[4].split(DraftCodec.IMAGE_SEPARATOR);
    return new CommentDraft(parts[0], parts[3], parts[1], parts[2], images);
  }

  roundTrip(draft: CommentDraft): CommentDraft | undefined {
    return this.decode(this.encode(draft));
  }
}

export class IdSequence {
  private current: number = 0;

  constructor(start: number = 1) {
    this.current = start;
  }

  next(): number {
    const value: number = this.current;
    this.current++;
    return value;
  }

  peekNext(): number {
    return this.current;
  }

  reset(start: number = 1): void {
    this.current = start;
  }
}

/** Builds a feed and assigns stable ids through IdSequence. */
export function buildFeed(count: number, prefix: string): Comment[] {
  const items: Comment[] = [];
  const sequence: IdSequence = new IdSequence();
  for (let index = 0; index < count; index++) {
    items.push(makeComment(
      sequence.next(),
      prefix + '_' + index,
      prefix + ' body ' + index,
      index % 2 === 0 ? 'app.media.icon_comment_app_logo1' : 'app.media.icon_comment_app_logo2',
      '02-07 13:' + padNumber(index % 60, 2),
      index % 2 === 0 ? ['app.media.icon_comment_landscape1'] : new Array<string>()
    ));
  }
  return items;
}

export function sumIds(items: Comment[]): number {
  let total: number = 0;
  for (let index = 0; index < items.length; index++) {
    total += items[index].id;
  }
  return total;
}

export function joinNames(items: Comment[]): string {
  let result: string = '';
  for (let index = 0; index < items.length; index++) {
    if (index > 0) {
      result += ',';
    }
    result += items[index].name;
  }
  return result;
}
