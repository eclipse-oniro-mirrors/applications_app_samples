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

import { NewsCommentModel } from '../../../../main/ets/model/NewsCommentModel.ets';
import { mockData, curUser } from '../../../../main/ets/mock/NewsDetailData.ets';

/** Fixed publish timestamp used by Index.ets for every locally created row. */
export const FIXED_TIME: string = '2024-11-01 23:00:00';

/** Mock data oracle, hand copied from NewsDetailData.ets. */
export const EXPECTED_IDS: Array<string> = ['1', '2', '3', '4', '5', '7', '8', '9'];

export const EXPECTED_USERS: Array<string> = [
  '你若安好便是晴天',
  '天要下雨娘要嫁人',
  '太阳打北边出来了',
  '西红柿炒鸡蛋蛋卷(特辣)',
  '东边有个塔玛，西边有个喇嘛',
  '等烟雨而我在等你',
  '大事不妙了',
  '小猫带耳机'
];

export const EXPECTED_TEXTS: Array<string> = [
  '国足加油！国足必胜！',
  '来点信心，加油加油~',
  '下一场什么时候，有直播吗',
  '教练组的战术调整值得肯定，尤其是在中场控制方面有所改善。',
  '期待他们在未来的比赛中继续进步！',
  '希望接下来的比赛中继续发挥，成为球队的中坚力量。',
  '与世界强队的差距依然显著，继续努力吧。',
  '国足必胜，加油加油。'
];

export const MODEL_FIELDS: Array<string> = [
  'id', 'url', 'user', 'replyId', 'replyUser', 'text', 'commentTime'
];

/* ----------------------- Layout oracle: CommentPage.ets ------------------ */

export const AVATAR_SIZE: number = 30;
export const AVATAR_RADIUS: number = 30;
export const AVATAR_MARGIN_TOP: number = 10;
export const AVATAR_MARGIN_LEFT: number = 15;
export const NAME_FONT_SIZE: number = 14;
export const NAME_FONT_WEIGHT: number = 500;
export const NAME_COLOR: string = '#000000';
export const NAME_WIDTH_PERCENT: number = 80;
export const NAME_MARGIN_BOTTOM: number = 6;
export const BODY_FONT_SIZE: number = 14;
export const BODY_FONT_WEIGHT: number = 400;
export const BODY_OPACITY: number = 0.8;
export const BODY_LINE_HEIGHT: number = 20;
export const BODY_WIDTH_PERCENT: number = 80;
export const BODY_MARGIN_BOTTOM: number = 6;
export const REPLY_ROW_WIDTH_PERCENT: number = 85;
export const REPLY_FONT_SIZE: number = 14;
export const REPLY_COLOR: string = '#368AEF';
export const REPLY_BACKGROUND: string = '#dbdbdb';
export const REPLY_RADIUS: number = 5;
export const REPLY_OPACITY: number = 0.8;
export const REPLY_PAD_HORIZONTAL: number = 3;
export const REPLY_PAD_VERTICAL: number = 2;
export const CONTENT_PAD_LEFT: number = 12;
export const CONTENT_PAD_TOP: number = 10;
export const ACTION_ICON_SIZE: number = 20;
export const ACTION_ICON_GAP: number = 20;

/* ------------------------- Layout oracle: Index.ets --------------------- */

export const TITLE_BAR_HEIGHT: number = 55;
export const TITLE_BAR_PADDING: number = 10;
export const AVATAR_BADGE_SIZE: number = 55;
export const BADGE_FONT_SIZE: number = 11;
export const BADGE_HEIGHT: number = 16;
export const BADGE_WIDTH: number = 55;
export const BADGE_TEXT_COLOR: string = '#ff3d36';
export const BADGE_BACKGROUND: string = '#ffeeee';
export const SEARCH_PLACEHOLDER_FONT: number = 14;
export const SEARCH_PLACEHOLDER_WEIGHT: number = 400;
export const SEARCH_HEIGHT_PERCENT: number = 75;
export const SEARCH_MARGIN_LEFT: number = 15;
export const HEADLINE_FONT_SIZE: number = 20;
export const HEADLINE_FONT_WEIGHT: number = 600;
export const HEADLINE_MARGIN: number = 10;
export const MEDIA_NAME_FONT_SIZE: number = 14;
export const MEDIA_INFO_FONT_SIZE: number = 12;
export const NEWS_ROW_HEIGHT: number = 40;
export const FOLLOW_BADGE_WIDTH: number = 50;
export const FOLLOW_BADGE_HEIGHT: number = 25;
export const FOLLOW_BADGE_FONT: number = 13;
export const FOLLOW_BADGE_BACKGROUND: string = '#ff3f3a';
export const STORY_FONT_SIZE: number = 18;
export const STORY_LINE_HEIGHT: number = 20;
export const DISCLAIMER_FONT_SIZE: number = 14;
export const COMMENT_TITLE_WIDTH_PERCENT: number = 95;
export const COMMENT_TITLE_HEIGHT: number = 30;
export const COMMENT_COUNT_FONT: number = 20;
export const COMMENT_COUNT_WEIGHT: number = 700;
export const COMMENT_ACTION_FONT: number = 14;
export const COMMENT_ACTION_WEIGHT: number = 700;
export const PUBLISH_BAR_HEIGHT: number = 40;
export const PUBLISH_BAR_RADIUS: number = 30;
export const PUBLISH_BAR_BORDER: number = 1;
export const PUBLISH_BAR_BORDER_COLOR: string = '#eeeeee';
export const PUBLISH_BAR_PAD_LEFT: number = 15;
export const PUBLISH_WRAP_HEIGHT: number = 100;
export const PUBLISH_WRAP_PAD: number = 10;
export const PANEL_HEIGHT_PERCENT: number = 95;
export const EDITOR_ROW_HEIGHT: number = 50;
export const EDITOR_PADDING: number = 10;
export const INPUT_HEIGHT: number = 40;
export const INPUT_PAD_LEFT: number = 10;
export const INPUT_PAD_RIGHT: number = 50;
export const INPUT_PAD_VERTICAL: number = 3;
export const PUBLISH_BUTTON_WIDTH: number = 60;
export const PUBLISH_BUTTON_HEIGHT: number = 30;
export const PUBLISH_BUTTON_RADIUS: number = 15;
export const PUBLISH_BUTTON_BACKGROUND: string = '#ed394b';
export const PUBLISH_BUTTON_FOREGROUND: string = '#ffffff';
export const PUBLISH_BUTTON_GAP: number = 10;
export const SHARE_BAR_HEIGHT: number = 60;
export const SHARE_ITEM_WIDTH_PERCENT: number = 25;
export const SHARE_ICON_SIZE: number = 20;
export const SHARE_ICON_GAP_LEFT: number = 5;
export const SHARE_ICON_GAP_RIGHT: number = 8;

/* --------------------------- Time oracle helpers ------------------------ */

/** Decomposed timestamp, produced by an independent parser. */
export class TimeParts {
  public year: number = 0;
  public month: number = 0;
  public day: number = 0;
  public hour: number = 0;
  public minute: number = 0;
  public second: number = 0;

  constructor(year: number, month: number, day: number, hour: number, minute: number, second: number) {
    this.year = year;
    this.month = month;
    this.day = day;
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }
}

/** True when value is one of the ten ASCII digits. */
export function isDigitChar(value: string): boolean {
  return value.length === 1 && value >= '0' && value <= '9';
}

/** Parses a fixed width number slice without Number() on the whole string. */
export function sliceNumber(value: string, start: int, length: int): number {
  if (start < 0 || start + length > value.length) {
    return -1;
  }
  let result: number = 0;
  for (let index = start; index < start + length; index++) {
    const digit: number = value.charCodeAt(index) - 48;
    if (digit < 0 || digit > 9) {
      return -1;
    }
    result = result * 10 + digit;
  }
  return result;
}

/** Parses 'YYYY-MM-DD HH:mm:ss', returning null when the shape is wrong. */
export function parseTime(value: string): TimeParts | null {
  if (value.length !== 19) {
    return null;
  }
  if (value.charAt(4).toString() !== '-' || value.charAt(7).toString() !== '-') {
    return null;
  }
  if (value.charAt(10).toString() !== ' ' || value.charAt(13).toString() !== ':' || value.charAt(16).toString() !== ':') {
    return null;
  }
  const year: number = sliceNumber(value, 0, 4);
  const month: number = sliceNumber(value, 5, 2);
  const day: number = sliceNumber(value, 8, 2);
  const hour: number = sliceNumber(value, 11, 2);
  const minute: number = sliceNumber(value, 14, 2);
  const second: number = sliceNumber(value, 17, 2);
  if (year < 0 || month < 0 || day < 0 || hour < 0 || minute < 0 || second < 0) {
    return null;
  }
  return new TimeParts(year, month, day, hour, minute, second);
}

/** Formats a TimeParts instance back into the canonical layout. */
export function formatTime(parts: TimeParts): string {
  const year: string = parts.year.toString();
  const month: string = parts.month < 10 ? `0${parts.month}` : parts.month.toString();
  const day: string = parts.day < 10 ? `0${parts.day}` : parts.day.toString();
  const hour: string = parts.hour < 10 ? `0${parts.hour}` : parts.hour.toString();
  const minute: string = parts.minute < 10 ? `0${parts.minute}` : parts.minute.toString();
  const second: string = parts.second < 10 ? `0${parts.second}` : parts.second.toString();
  return `${year}-${month}-${day} ${hour}:${minute}:${second}`;
}

/** Calendar oracle: Gregorian leap year rule. */
export function isLeapYear(year: number): boolean {
  if (year % 400 === 0) {
    return true;
  }
  if (year % 100 === 0) {
    return false;
  }
  return year % 4 === 0;
}

/** Calendar oracle: number of days of a month, zero for invalid months. */
export function daysInMonth(year: number, month: number): number {
  if (month < 1 || month > 12) {
    return 0;
  }
  if (month === 2) {
    return isLeapYear(year) ? 29 : 28;
  }
  if (month === 4 || month === 6 || month === 9 || month === 11) {
    return 30;
  }
  return 31;
}

/** Full range validation of one timestamp string. */
export function isValidTime(value: string): boolean {
  const parts: TimeParts | null = parseTime(value);
  if (parts === null) {
    return false;
  }
  if (parts.year < 1970 || parts.year > 2100) {
    return false;
  }
  if (parts.month < 1 || parts.month > 12) {
    return false;
  }
  if (parts.day < 1 || parts.day > daysInMonth(parts.year, parts.month)) {
    return false;
  }
  if (parts.hour > 23 || parts.minute > 59 || parts.second > 59) {
    return false;
  }
  return true;
}

/* ----------------------------- UUID oracle ----------------------------- */

/** True for 0-9, a-f and A-F. */
export function isHexChar(value: string): boolean {
  if (value.length !== 1) {
    return false;
  }
  const lower: boolean = value >= 'a' && value <= 'f';
  const upper: boolean = value >= 'A' && value <= 'F';
  const digit: boolean = value >= '0' && value <= '9';
  return lower || upper || digit;
}

/** Structural validation of a canonical 8-4-4-4-12 UUID. */
export function isCanonicalUuid(value: string): boolean {
  if (value.length !== 36) {
    return false;
  }
  if (value.charAt(8).toString() !== '-' || value.charAt(13).toString() !== '-' ||
    value.charAt(18).toString() !== '-' || value.charAt(23).toString() !== '-') {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    if (index === 8 || index === 13 || index === 18 || index === 23) {
      continue;
    }
    if (!isHexChar(value.charAt(index).toString())) {
      return false;
    }
  }
  return true;
}

const HEX_DIGITS: string = '0123456789abcdef';

/** Deterministic UUID-shaped token, so tests never depend on randomness. */
export function makeUuid(seed: number): string {
  let state: number = ((seed % 2147483646) + 2147483646) % 2147483646 + 1;
  let raw: string = '';
  for (let index = 0; index < 32; index++) {
    state = (state * 48271) % 2147483647;
    const slot: int = (state % 16).toInt();
    raw += HEX_DIGITS.charAt(slot).toString();
  }
  const block1: string = raw.substring(0, 8);
  const block2: string = raw.substring(8, 12);
  const block3: string = `4${raw.substring(13, 16)}`;
  const variant: string = `a${raw.substring(17, 20)}`;
  const block5: string = raw.substring(20, 32);
  return `${block1}-${block2}-${block3}-${variant}-${block5}`;
}

/* --------------------------- Text helpers ------------------------------ */

/** Counts occurrences of a single character inside value. */
export function countChar(value: string, target: string): number {
  let count: number = 0;
  for (let index = 0; index < value.length; index++) {
    if (value.charAt(index).toString() === target) {
      count++;
    }
  }
  return count;
}

/** Stable 32 bit digest of a string, computed without external helpers. */
export function stableHash(value: string): number {
  let hash: number = 5381;
  for (let index = 0; index < value.length; index++) {
    hash = (hash * 33 + value.charCodeAt(index)) % 4294967296;
  }
  return hash;
}

/** Joins ids with a pipe, giving a compact fingerprint of list order. */
export function joinIds(list: Array<NewsCommentModel>): string {
  let joined: string = '';
  for (let index = 0; index < list.length; index++) {
    if (index > 0) {
      joined += '|';
    }
    joined += list[index].id;
  }
  return joined;
}

/** Counts distinct ids; equal to list length when every id is unique. */
export function distinctIdCount(list: Array<NewsCommentModel>): number {
  const seen: Array<string> = [];
  for (let index = 0; index < list.length; index++) {
    const id: string = list[index].id;
    if (seen.indexOf(id) < 0) {
      seen.push(id);
    }
  }
  return seen.length;
}

/** Returns the tail slice of a list, or an empty list when count is 0. */
export function tailOf(list: Array<NewsCommentModel>, count: int): Array<NewsCommentModel> {
  if (count <= 0) {
    return [];
  }
  if (count >= list.length) {
    return list.slice(0);
  }
  return list.slice(list.length - count);
}

/** Independent clone helper used to prove that fields are value copies. */
export function cloneComment(source: NewsCommentModel): NewsCommentModel {
  return new NewsCommentModel(
    source.id, source.url, source.user, source.replyId, source.replyUser, source.text, source.commentTime);
}

/** True when all seven fields are equal, compared field by field. */
export function sameFields(left: NewsCommentModel, right: NewsCommentModel): boolean {
  const idOk: boolean = left.id === right.id;
  const urlOk: boolean = left.url === right.url;
  const userOk: boolean = left.user === right.user;
  const replyIdOk: boolean = left.replyId === right.replyId;
  const replyUserOk: boolean = left.replyUser === right.replyUser;
  const textOk: boolean = left.text === right.text;
  const timeOk: boolean = left.commentTime === right.commentTime;
  return idOk && urlOk && userOk && replyIdOk && replyUserOk && textOk && timeOk;
}
/* ------------------------- Publish state machine ----------------------- */

/**
 * Pure logic replica of the Index.ets publish flow. `editing` is the inverse
 * of `isVariable`: editing means the TextInput row is mounted.
 */
export class CommentBoard {
  public comments: Array<NewsCommentModel> = [];
  public draft: string = '';
  public editing: boolean = false;
  public publishCount: number = 0;
  public lastId: string = '';
  public seeded: boolean = false;

  constructor(useMockSeed: boolean) {
    this.seeded = useMockSeed;
    this.comments = useMockSeed ? mockData() : [];
  }

  /** Number of comment rows currently rendered. */
  public get count(): int {
    return this.comments.length;
  }

  /** Mirrors `isVariable`: the list panel is visible while not editing. */
  public get listVisible(): boolean {
    return !this.editing;
  }

  /** Opens the composer; a second open is rejected. */
  public openComposer(): boolean {
    if (this.editing) {
      return false;
    }
    this.editing = true;
    return true;
  }

  /** Typing is only accepted while the editor is mounted. */
  public updateDraft(value: string): boolean {
    if (!this.editing) {
      return false;
    }
    this.draft = value;
    return true;
  }

  /** Source rule: a draft is publishable when it is not the empty string. */
  public get canPublish(): boolean {
    return this.draft !== '';
  }

  /** Publishes with a caller supplied id so assertions stay deterministic. */
  public publish(idToken: string): NewsCommentModel | null {
    if (!this.editing || !this.canPublish) {
      return null;
    }
    const row: NewsCommentModel = new NewsCommentModel(
      idToken, '', curUser, '', '', this.draft, FIXED_TIME);
    this.comments = [...this.comments, row];
    this.draft = '';
    this.editing = false;
    this.publishCount++;
    this.lastId = idToken;
    return row;
  }

  /** Closes the composer without publishing, dropping the draft. */
  public cancel(): boolean {
    if (!this.editing) {
      return false;
    }
    this.editing = false;
    this.draft = '';
    return true;
  }

  /** Appends a reply row that carries replyId / replyUser metadata. */
  public reply(target: NewsCommentModel, replyId: string, replyUser: string, text: string,
    idToken: string): NewsCommentModel | null {
    if (text === '' || target.id === '') {
      return null;
    }
    const row: NewsCommentModel = new NewsCommentModel(
      idToken, '', curUser, replyId, replyUser, text, FIXED_TIME);
    this.comments = [...this.comments, row];
    return row;
  }

  /** Returns the rows whose user matches, preserving list order. */
  public byUser(user: string): Array<NewsCommentModel> {
    const result: Array<NewsCommentModel> = [];
    for (let index = 0; index < this.comments.length; index++) {
      if (this.comments[index].user === user) {
        result.push(this.comments[index]);
      }
    }
    return result;
  }

  /** Resets to the seed state without reloading the fixture. */
  public reset(): void {
    this.comments = this.seeded ? mockData() : [];
    this.draft = '';
    this.editing = false;
    this.publishCount = 0;
    this.lastId = '';
  }

  /** Read-only view of the ids in render order. */
  public ids(): Array<string> {
    const result: Array<string> = [];
    for (let index = 0; index < this.comments.length; index++) {
      result.push(this.comments[index].id);
    }
    return result;
  }
}

/**
 * Drives a board through a script of operations. Supported opcodes:
 *   'open', 'focus', 'blur'   composer mount state
 *   'type:<payload>'          replace the draft
 *   'publish:<id>'            publish attempt
 *   'cancel'                  dismiss the composer
 *   'reply:<index>:<id>:<text>' append a reply to a row
 * Returns the number of accepted operations.
 */
export function runScript(board: CommentBoard, script: Array<string>): number {
  let accepted: number = 0;
  for (let index = 0; index < script.length; index++) {
    const step: string = script[index];
    if (step === 'open') {
      if (board.openComposer()) {
        accepted++;
      }
      continue;
    }
    if (step === 'cancel') {
      if (board.cancel()) {
        accepted++;
      }
      continue;
    }
    if (step.indexOf('type:') === 0) {
      if (board.updateDraft(step.substring(5))) {
        accepted++;
      }
      continue;
    }
    if (step.indexOf('publish:') === 0) {
      if (board.publish(step.substring(8)) !== null) {
        accepted++;
      }
      continue;
    }
    if (step.indexOf('reply:') === 0) {
      const body: string = step.substring(6);
      const first: int = body.indexOf(':');
      if (first < 0) {
        continue;
      }
      const second: int = body.indexOf(':', first + 1);
      if (second < 0) {
        continue;
      }
      const rowIndex: number = Number(body.substring(0, first));
      const idToken: string = body.substring(first + 1, second);
      const payload: string = body.substring(second + 1);
      if (rowIndex < 0 || rowIndex >= board.comments.length) {
        continue;
      }
      const target: NewsCommentModel = board.comments[rowIndex.toInt()];
      if (board.reply(target, target.id, target.user, payload, idToken) !== null) {
        accepted++;
      }
    }
  }
  return accepted;
}

/** Expectation table for a scripted run, filled by the caller. */
export class BoardSnapshot {
  public count: number = 0;
  public ids: string = '';
  public editing: boolean = false;
  public draft: string = '';
  public publishCount: number = 0;
  public lastText: string = '';
  public lastUser: string = '';
  public lastId: string = '';
}

/** Captures the externally observable state of a board. */
export function snapshot(board: CommentBoard): BoardSnapshot {
  const result: BoardSnapshot = new BoardSnapshot();
  result.count = board.count;
  result.ids = joinIds(board.comments);
  result.editing = board.editing;
  result.draft = board.draft;
  result.publishCount = board.publishCount;
  if (board.comments.length > 0) {
    const last: NewsCommentModel = board.comments[board.comments.length - 1];
    result.lastText = last.text;
    result.lastUser = last.user;
    result.lastId = last.id;
  }
  return result;
}

/** Repeats a board cycle count times, returning elapsed wall clock millis. */
export function runPublishCycles(board: CommentBoard, count: number, payload: string): number {
  const started: number = Date.now();
  for (let index = 0; index < count; index++) {
    board.openComposer();
    board.updateDraft(payload);
    board.publish(`cycle-${index}`);
  }
  return Date.now() - started;
}

/** Builds a comment from positional arguments, mirroring the constructor. */
export function makeComment(id: string, user: string, text: string, replyId: string,
  replyUser: string, time: string): NewsCommentModel {
  return new NewsCommentModel(id, '', user, replyId, replyUser, text, time);
}

/** Every mock row must satisfy this basic field contract. */
export function allFieldsNonEmptyText(list: Array<NewsCommentModel>): boolean {
  for (let index = 0; index < list.length; index++) {
    if (list[index].text.length === 0) {
      return false;
    }
    if (list[index].id.length === 0) {
      return false;
    }
  }
  return true;
}

/** Validates the full mock fixture against the hard coded oracle. */
export function mockMatchesOracle(list: Array<NewsCommentModel>): boolean {
  if (list.length !== EXPECTED_IDS.length) {
    return false;
  }
  for (let index = 0; index < list.length; index++) {
    if (list[index].id !== EXPECTED_IDS[index]) {
      return false;
    }
    if (list[index].user !== EXPECTED_USERS[index]) {
      return false;
    }
    if (list[index].text !== EXPECTED_TEXTS[index]) {
      return false;
    }
  }
  return true;
}
