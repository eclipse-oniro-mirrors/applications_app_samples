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

import { describe, it, expect, beforeAll, beforeEach, afterEach } from '@ohos/hypium';
import IssueDetailInfo, {
  Attachment,
  IssueUpdateTime,
  PROMPT_TIME,
  Probability,
  TIME_INT,
  TIME_INT_VIS,
  UploadBody,
  issueTypeList,
  probabilityList,
  statusList
} from '../../../../main/ets/pages/IssueReporter/models/IssueDetailInfo';

// Probability ids declared by Probability#set id in IssueDetailInfo.ets
const PROBABILITY_ID_VERY_LOW: string = '0';

const PROBABILITY_ID_ONCE_A_DAY: string = '1';

const PROBABILITY_ID_MANY_TIMES_A_DAY: string = '2';

const PROBABILITY_ID_ALWAYS: string = '3';

const PROBABILITY_ID_INVALID: string = '9';

// Descriptions are index-aligned with probabilityList from the model
const PROBABILITY_DESC_VERY_LOW: string = probabilityList[0];

const PROBABILITY_DESC_ONCE_A_DAY: string = probabilityList[1];

const PROBABILITY_DESC_MANY_TIMES_A_DAY: string = probabilityList[2];

const PROBABILITY_DESC_ALWAYS: string = probabilityList[3];

// Status descriptions are index-aligned with statusList from the model
const STATUS_WAIT_CONFIRM: string = statusList[0];

const STATUS_PROCESSING: string = statusList[1];

const STATUS_RESOLVED: string = statusList[2];

const STATUS_NOT_ISSUE: string = statusList[3];

const STATUS_SUSPENDED: string = statusList[4];

const STATUS_UPLOADING: string = statusList[5];

const STATUS_UPLOAD_FAILED: string = statusList[6];

const STATUS_SUBMIT_FAILED: string = statusList[7];

const STATUS_SUBMIT_SUCCESS: string = statusList[8];

const ATTACHMENT_TYPE_IMAGE: string = 'image';

const ATTACHMENT_TYPE_VIDEO: string = 'video';

const ATTACHMENT_TYPE_AUDIO: string = 'audio';

const ATTACHMENT_TYPE_FILE: string = 'file';

interface ProbabilityCase {
  id: string;
  desc: string;
}

interface AttachmentCase {
  type: string;
  url: string;
  id: string;
  thumbnail: string;
}

// Validates the probability option model without touching UI state
class ProbabilityValidator {
  public static build(id: string): Probability {
    const probability = new Probability();
    probability.id = id;
    return probability;
  }

  public static isKnownId(id: string): boolean {
    return id === PROBABILITY_ID_VERY_LOW || id === PROBABILITY_ID_ONCE_A_DAY ||
      id === PROBABILITY_ID_MANY_TIMES_A_DAY || id === PROBABILITY_ID_ALWAYS;
  }

  public static descriptionOf(id: string): string {
    switch (id) {
      case PROBABILITY_ID_VERY_LOW:
        return PROBABILITY_DESC_VERY_LOW;
      case PROBABILITY_ID_ONCE_A_DAY:
        return PROBABILITY_DESC_ONCE_A_DAY;
      case PROBABILITY_ID_MANY_TIMES_A_DAY:
        return PROBABILITY_DESC_MANY_TIMES_A_DAY;
      case PROBABILITY_ID_ALWAYS:
        return PROBABILITY_DESC_ALWAYS;
      default:
        return '';
    }
  }

  public static cases(): ProbabilityCase[] {
    return [
      { id: PROBABILITY_ID_VERY_LOW, desc: PROBABILITY_DESC_VERY_LOW },
      { id: PROBABILITY_ID_ONCE_A_DAY, desc: PROBABILITY_DESC_ONCE_A_DAY },
      { id: PROBABILITY_ID_MANY_TIMES_A_DAY, desc: PROBABILITY_DESC_MANY_TIMES_A_DAY },
      { id: PROBABILITY_ID_ALWAYS, desc: PROBABILITY_DESC_ALWAYS }
    ];
  }
}

// Validates attachment payloads produced by the upload flow
class AttachmentValidator {
  public static isSupportedType(type: string): boolean {
    return type === ATTACHMENT_TYPE_IMAGE || type === ATTACHMENT_TYPE_VIDEO ||
      type === ATTACHMENT_TYPE_AUDIO || type === ATTACHMENT_TYPE_FILE;
  }

  public static isRemote(attachment: Attachment): boolean {
    return attachment.url.length > 0 && attachment.id.length > 0;
  }

  public static isThumbnailReady(attachment: Attachment): boolean {
    if (typeof attachment.thumbnail === 'string') {
      return (attachment.thumbnail as string).length > 0;
    }
    return attachment.thumbnail !== undefined && attachment.thumbnail !== null;
  }

  public static countRemote(attachments: Attachment[]): number {
    let count: number = 0;
    for (let i = 0; i < attachments.length; i++) {
      if (AttachmentValidator.isRemote(attachments[i])) {
        count++;
      }
    }
    return count;
  }

  public static cases(): AttachmentCase[] {
    return [
      { type: ATTACHMENT_TYPE_IMAGE, url: 'https://example.com/a.png', id: '1', thumbnail: 'base64-a' },
      { type: ATTACHMENT_TYPE_VIDEO, url: 'https://example.com/b.mp4', id: '2', thumbnail: 'base64-b' },
      { type: ATTACHMENT_TYPE_AUDIO, url: 'https://example.com/c.mp3', id: '3', thumbnail: '' },
      { type: ATTACHMENT_TYPE_FILE, url: 'https://example.com/d.log', id: '4', thumbnail: '' }
    ];
  }
}

// Validates the issue status catalogue used by list and detail pages
class IssueStatusValidator {
  public static isKnownStatus(status: string): boolean {
    return statusList.includes(status);
  }

  public static indexOf(status: string): number {
    return statusList.indexOf(status);
  }

  public static isTerminal(status: string): boolean {
    return status === STATUS_SUBMIT_SUCCESS || status === STATUS_NOT_ISSUE || status === STATUS_RESOLVED;
  }

  public static isFailure(status: string): boolean {
    return status === STATUS_UPLOAD_FAILED || status === STATUS_SUBMIT_FAILED;
  }

  public static isInProgress(status: string): boolean {
    return status === STATUS_PROCESSING || status === STATUS_UPLOADING || status === STATUS_WAIT_CONFIRM;
  }
}

// Normalizes issue payload defaults before submission
class IssuePayloadNormalizer {
  public static normalize(info: IssueDetailInfo): IssueDetailInfo {
    if (info.remark === undefined) {
      info.remark = '';
    }
    if (info.phone === undefined) {
      info.phone = '';
    }
    if (info.attachment === undefined) {
      info.attachment = [];
    }
    if (info.probabilityObj === undefined) {
      info.probabilityObj = new Probability();
    }
    return info;
  }

  public static hasDescription(info: IssueDetailInfo): boolean {
    return info.description !== undefined && info.description.length > 0;
  }

  public static hasAttachments(info: IssueDetailInfo): boolean {
    return info.attachment !== undefined && info.attachment.length > 0;
  }

  public static resolveProbabilityDesc(info: IssueDetailInfo): string {
    if (info.probabilityDesc.length > 0) {
      return info.probabilityDesc;
    }
    if (info.probabilityObj !== undefined) {
      return info.probabilityObj.des;
    }
    return '';
  }
}

// Validates issue id formats accepted by the report page
class IssueIdValidator {
  public static readonly MIN_LENGTH: number = 6;

  public static readonly MAX_LENGTH: number = 64;

  public static isLengthValid(id: string): boolean {
    return id.length >= IssueIdValidator.MIN_LENGTH && id.length <= IssueIdValidator.MAX_LENGTH;
  }

  public static hasAllowedCharacters(id: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]+$');
    return pattern.test(id);
  }

  public static isServerId(id: string): boolean {
    const prefix = 'ISSUE-';
    return id.startsWith(prefix) && id.length > prefix.length && IssueIdValidator.isLengthValid(id);
  }

  public static isLocalDraftId(id: string): boolean {
    const prefix = 'draft-';
    return id.startsWith(prefix) && id.length > prefix.length && IssueIdValidator.isLengthValid(id);
  }

  public static isValid(id: string): boolean {
    return IssueIdValidator.isLengthValid(id) && IssueIdValidator.hasAllowedCharacters(id);
  }
}

// Sorts and filters the issue list returned by the server
class IssueListToolkit {
  public static sortByTimeDescending(items: IssueDetailInfo[]): IssueDetailInfo[] {
    const copy: IssueDetailInfo[] = [...items];
    copy.sort((left: IssueDetailInfo, right: IssueDetailInfo) =>
      (right.timeStamp ?? 0) - (left.timeStamp ?? 0));
    return copy;
  }

  public static filterByStatus(items: IssueDetailInfo[], status: string): IssueDetailInfo[] {
    return items.filter((item: IssueDetailInfo) => item.status === status);
  }

  public static filterByType(items: IssueDetailInfo[], type: string): IssueDetailInfo[] {
    return items.filter((item: IssueDetailInfo) => item.type === type);
  }

  public static countByStatus(items: IssueDetailInfo[], status: string): number {
    let count: number = 0;
    for (let i = 0; i < items.length; i++) {
      if (items[i].status === status) {
        count++;
      }
    }
    return count;
  }

  public static findById(items: IssueDetailInfo[], issueId: string): IssueDetailInfo | undefined {
    for (let i = 0; i < items.length; i++) {
      if (items[i].issueId === issueId) {
        return items[i];
      }
    }
    return undefined;
  }

  public static uniqueIds(items: IssueDetailInfo[]): string[] {
    const ids: Set<string> = new Set<string>();
    const result: string[] = [];
    for (let i = 0; i < items.length; i++) {
      if (!ids.has(items[i].issueId)) {
        ids.add(items[i].issueId);
        result.push(items[i].issueId);
      }
    }
    return result;
  }
}

// Merges locally submitted drafts with the server list
class IssueMergeToolkit {
  public static merge(local: IssueDetailInfo[], remote: IssueDetailInfo[]): IssueDetailInfo[] {
    const merged: IssueDetailInfo[] = [];
    const remoteIds: Set<string> = new Set<string>();
    for (let i = 0; i < remote.length; i++) {
      remoteIds.add(remote[i].issueId);
      merged.push(remote[i]);
    }
    for (let i = 0; i < local.length; i++) {
      if (!remoteIds.has(local[i].issueId)) {
        merged.push(local[i]);
      }
    }
    return merged;
  }

  public static pendingOnly(local: IssueDetailInfo[]): IssueDetailInfo[] {
    return local.filter((item: IssueDetailInfo) => item.isNew === true);
  }

  public static replaceById(items: IssueDetailInfo[], updated: IssueDetailInfo): boolean {
    for (let i = 0; i < items.length; i++) {
      if (items[i].issueId === updated.issueId) {
        items[i] = updated;
        return true;
      }
    }
    return false;
  }

  public static removeById(items: IssueDetailInfo[], issueId: string): number {
    const before = items.length;
    for (let i = items.length - 1; i >= 0; i--) {
      if (items[i].issueId === issueId) {
        items.splice(i, 1);
      }
    }
    return before - items.length;
  }
}

// Guards status transitions in the detail page
class IssueStatusTransition {
  public static readonly ALLOWED: string[][] = [
    [STATUS_WAIT_CONFIRM, STATUS_PROCESSING],
    [STATUS_PROCESSING, STATUS_RESOLVED],
    [STATUS_PROCESSING, STATUS_SUSPENDED],
    [STATUS_SUSPENDED, STATUS_PROCESSING],
    [STATUS_WAIT_CONFIRM, STATUS_NOT_ISSUE],
    [STATUS_UPLOADING, STATUS_SUBMIT_SUCCESS],
    [STATUS_UPLOADING, STATUS_UPLOAD_FAILED]
  ];

  public static canTransition(from: string, to: string): boolean {
    for (let i = 0; i < IssueStatusTransition.ALLOWED.length; i++) {
      if (IssueStatusTransition.ALLOWED[i][0] === from && IssueStatusTransition.ALLOWED[i][1] === to) {
        return true;
      }
    }
    return false;
  }

  public static isRetryable(from: string): boolean {
    return from === STATUS_UPLOAD_FAILED || from === STATUS_SUBMIT_FAILED;
  }

  public static nextOf(from: string): string[] {
    const next: string[] = [];
    for (let i = 0; i < IssueStatusTransition.ALLOWED.length; i++) {
      if (IssueStatusTransition.ALLOWED[i][0] === from) {
        next.push(IssueStatusTransition.ALLOWED[i][1]);
      }
    }
    return next;
  }
}

// Manages the attachment collection inside the create page
class AttachmentCollection {
  private items: Attachment[] = [];
  private readonly limit: number;

  constructor(limit: number) {
    this.limit = limit;
  }

  public add(attachment: Attachment): boolean {
    if (this.items.length >= this.limit) {
      return false;
    }
    this.items.push(attachment);
    return true;
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.items.length) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.items.length;
  }

  public getItems(): Attachment[] {
    return [...this.items];
  }

  public isFull(): boolean {
    return this.items.length >= this.limit;
  }

  public clear(): void {
    this.items = [];
  }

  public countByType(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].type === type) {
        count++;
      }
    }
    return count;
  }
}

// Formats the fault time values used by the form and list pages
class IssueTimeToolkit {
  public static isTimestampValid(timestamp: number): boolean {
    return timestamp > 0 && Number.isFinite(timestamp);
  }

  public static pad(value: number): string {
    return value < 10 ? `0${value}` : `${value}`;
  }

  public static formatDuration(milliseconds: number): string {
    if (milliseconds < 0) {
      return '0s';
    }
    const seconds = Math.floor(milliseconds / 1000);
    return `${seconds}s`;
  }

  public static formatClock(totalSeconds: number): string {
    if (totalSeconds < 0) {
      totalSeconds = 0;
    }
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    return `${IssueTimeToolkit.pad(hours)}:${IssueTimeToolkit.pad(minutes)}:${IssueTimeToolkit.pad(seconds)}`;
  }

  public static newerThan(first: IssueDetailInfo, second: IssueDetailInfo): boolean {
    return (first.timeStamp ?? 0) > (second.timeStamp ?? 0);
  }
}

export default function issueModelDeepTest() {
  describe('IssueModelDeep_Test', () => {
    let info: IssueDetailInfo;

    beforeAll(() => {
      info = new IssueDetailInfo();
    });

    beforeEach(() => {
      info = new IssueDetailInfo();
    });

    afterEach(() => {
      info = new IssueDetailInfo();
    });

    it('issue_detail_info_should_have_empty_defaults', 0, () => {
      expect(info.issueId).assertEqual('');
      expect(info.devid).assertEqual('');
      expect(info.faultTime).assertEqual('');
      expect(info.probability).assertEqual('');
      expect(info.probabilityDesc).assertEqual('');
      expect(info.description).assertEqual('');
      expect(info.status).assertEqual('');
      expect(info.statusDesc).assertEqual('');
      expect(info.remark as string).assertEqual('');
      expect(info.phone as string).assertEqual('');
      expect(info.logs).assertEqual('');
    });

    it('issue_detail_info_optional_flags_should_default_to_false', 0, () => {
      expect(info.hasLogTar).assertFalse();
      expect(info.isNew).assertFalse();
      expect(info.timeStamp as number).assertEqual(0);
      expect(info.updateTime as string).assertEqual('');
      expect(info.type as string).assertEqual('');
      expect(info.attachment !== undefined).assertTrue();
      expect((info.attachment as Attachment[]).length).assertEqual(0);
      expect(info.probabilityObj !== undefined).assertTrue();
    });

    it('probability_should_map_every_known_id_to_description', 0, () => {
      const cases = ProbabilityValidator.cases();
      expect(cases.length).assertEqual(4);
      for (let i = 0; i < cases.length; i++) {
        const probability = ProbabilityValidator.build(cases[i].id);
        expect(probability.id).assertEqual(cases[i].id);
        expect(probability.des).assertEqual(cases[i].desc);
        expect(probability.des).assertEqual(probabilityList[i]);
        expect(probability.des).assertEqual(ProbabilityValidator.descriptionOf(cases[i].id));
        expect(probability.isSelect).assertFalse();
      }
    });

    it('probability_should_keep_id_when_value_is_invalid', 0, () => {
      const probability = ProbabilityValidator.build(PROBABILITY_ID_INVALID);
      expect(probability.id).assertEqual(PROBABILITY_ID_INVALID);
      expect(probability.des).assertEqual('');
      expect(ProbabilityValidator.isKnownId(PROBABILITY_ID_INVALID)).assertFalse();
    });

    it('probability_should_accept_reassignment', 0, () => {
      const probability = ProbabilityValidator.build(PROBABILITY_ID_VERY_LOW);
      expect(probability.des).assertEqual(PROBABILITY_DESC_VERY_LOW);
      probability.id = PROBABILITY_ID_ALWAYS;
      expect(probability.id).assertEqual(PROBABILITY_ID_ALWAYS);
      expect(probability.des).assertEqual(PROBABILITY_DESC_ALWAYS);
      probability.isSelect = true;
      expect(probability.isSelect).assertTrue();
      expect(probability.TAG).assertEqual('Probability');
    });

    it('probability_list_should_match_descriptions_in_order', 0, () => {
      expect(probabilityList.length).assertEqual(4);
      for (let i = 0; i < probabilityList.length; i++) {
        expect(ProbabilityValidator.isKnownId(`${i}`)).assertTrue();
        expect(ProbabilityValidator.descriptionOf(`${i}`)).assertEqual(probabilityList[i]);
        expect(ProbabilityValidator.build(`${i}`).des).assertEqual(probabilityList[i]);
      }
    });

    it('status_list_should_cover_all_pipeline_states', 0, () => {
      expect(statusList.length).assertEqual(9);
      expect(statusList[0]).assertEqual(STATUS_WAIT_CONFIRM);
      expect(statusList[1]).assertEqual(STATUS_PROCESSING);
      expect(statusList[2]).assertEqual(STATUS_RESOLVED);
      expect(statusList[3]).assertEqual(STATUS_NOT_ISSUE);
      expect(statusList[4]).assertEqual(STATUS_SUSPENDED);
      expect(statusList[5]).assertEqual(STATUS_UPLOADING);
      expect(statusList[6]).assertEqual(STATUS_UPLOAD_FAILED);
      expect(statusList[7]).assertEqual(STATUS_SUBMIT_FAILED);
      expect(statusList[8]).assertEqual(STATUS_SUBMIT_SUCCESS);
    });

    it('status_validator_should_classify_states', 0, () => {
      expect(IssueStatusValidator.isKnownStatus(STATUS_PROCESSING)).assertTrue();
      expect(IssueStatusValidator.isKnownStatus('unknown')).assertFalse();
      expect(IssueStatusValidator.indexOf(STATUS_SUBMIT_SUCCESS)).assertEqual(8);
      expect(IssueStatusValidator.indexOf('unknown')).assertEqual(-1);
      expect(IssueStatusValidator.isTerminal(STATUS_RESOLVED)).assertTrue();
      expect(IssueStatusValidator.isTerminal(STATUS_PROCESSING)).assertFalse();
      expect(IssueStatusValidator.isFailure(STATUS_UPLOAD_FAILED)).assertTrue();
      expect(IssueStatusValidator.isFailure(STATUS_SUBMIT_SUCCESS)).assertFalse();
      expect(IssueStatusValidator.isInProgress(STATUS_UPLOADING)).assertTrue();
      expect(IssueStatusValidator.isInProgress(STATUS_SUSPENDED)).assertFalse();
    });

    it('issue_type_list_should_contain_supported_types', 0, () => {
      expect(issueTypeList.length).assertEqual(4);
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < issueTypeList.length; i++) {
        expect(issueTypeList[i].length).assertLarger(0);
        unique.add(issueTypeList[i]);
      }
      expect(unique.size).assertEqual(issueTypeList.length);
      expect(issueTypeList.includes('unsupported')).assertFalse();
    });

    it('attachment_should_have_empty_defaults', 0, () => {
      const attachment = new Attachment();
      expect(attachment.type).assertEqual('');
      expect(attachment.id).assertEqual('');
      expect(attachment.url).assertEqual('');
      expect(attachment.thumbnail).assertEqual('');
      expect(AttachmentValidator.isRemote(attachment)).assertFalse();
    });

    it('attachment_types_should_be_recognized', 0, () => {
      const cases = AttachmentValidator.cases();
      expect(cases.length).assertEqual(4);
      for (let i = 0; i < cases.length; i++) {
        const attachment = new Attachment();
        attachment.type = cases[i].type;
        attachment.url = cases[i].url;
        attachment.id = cases[i].id;
        attachment.thumbnail = cases[i].thumbnail;
        expect(AttachmentValidator.isSupportedType(attachment.type)).assertTrue();
        expect(AttachmentValidator.isRemote(attachment)).assertTrue();
        expect(AttachmentValidator.isThumbnailReady(attachment)).assertEqual(cases[i].thumbnail.length > 0);
      }
      expect(AttachmentValidator.isSupportedType('unknown')).assertFalse();
    });

    it('attachment_remote_count_should_ignore_incomplete_payloads', 0, () => {
      const remote = new Attachment();
      remote.type = ATTACHMENT_TYPE_IMAGE;
      remote.url = 'https://example.com/remote.png';
      remote.id = 'remote-1';

      const urlOnly = new Attachment();
      urlOnly.type = ATTACHMENT_TYPE_IMAGE;
      urlOnly.url = 'https://example.com/url-only.png';

      const idOnly = new Attachment();
      idOnly.type = ATTACHMENT_TYPE_VIDEO;
      idOnly.id = 'id-only';

      const attachments: Attachment[] = [remote, urlOnly, idOnly];
      expect(AttachmentValidator.countRemote(attachments)).assertEqual(1);
      expect(attachments.length).assertEqual(3);
      expect(AttachmentValidator.isRemote(urlOnly)).assertFalse();
      expect(AttachmentValidator.isRemote(idOnly)).assertFalse();
    });

    it('upload_body_should_default_to_empty_result', 0, () => {
      const body = new UploadBody();
      expect(body.code).assertEqual(0);
      expect(body.msg).assertEqual('');
      expect(body.data.type).assertEqual('');
      expect(body.data.id).assertEqual('');
      expect(body.data.url).assertEqual('');
    });

    it('upload_body_should_carry_server_attachment', 0, () => {
      const body = new UploadBody();
      body.code = 200;
      body.msg = 'ok';
      body.data.type = ATTACHMENT_TYPE_VIDEO;
      body.data.id = 'server-id';
      body.data.url = 'https://example.com/server.mp4';
      expect(body.code).assertEqual(200);
      expect(body.msg).assertEqual('ok');
      expect(AttachmentValidator.isRemote(body.data)).assertTrue();
      expect(AttachmentValidator.isSupportedType(body.data.type)).assertTrue();
    });

    it('issue_update_time_should_store_id_and_time', 0, () => {
      const updateTime = new IssueUpdateTime();
      expect(updateTime.id).assertEqual('');
      expect(updateTime.time).assertEqual('');
      updateTime.id = 'issue-1';
      updateTime.time = '19900101000000';
      expect(updateTime.id).assertEqual('issue-1');
      expect(updateTime.time.length).assertEqual(14);
      expect(updateTime.time).assertContain('1990');
    });

    it('model_time_constants_should_keep_expected_values', 0, () => {
      expect(TIME_INT).assertEqual(1000);
      expect(TIME_INT_VIS).assertEqual(500);
      expect(PROMPT_TIME).assertEqual(2000);
      expect(TIME_INT).assertLarger(TIME_INT_VIS);
      expect(PROMPT_TIME).assertLargerOrEqual(TIME_INT);
    });

    it('payload_normalizer_should_fill_nullish_fields', 0, () => {
      const target = new IssueDetailInfo();
      target.remark = undefined;
      target.phone = undefined;
      target.attachment = undefined;
      target.probabilityObj = undefined;
      const normalized = IssuePayloadNormalizer.normalize(target);
      expect(normalized.remark).assertEqual('');
      expect(normalized.phone).assertEqual('');
      expect(normalized.attachment !== undefined).assertTrue();
      expect((normalized.attachment as Attachment[]).length).assertEqual(0);
      expect(normalized.probabilityObj !== undefined).assertTrue();
      expect(IssuePayloadNormalizer.hasDescription(normalized)).assertFalse();
      expect(IssuePayloadNormalizer.hasAttachments(normalized)).assertFalse();
    });

    it('payload_normalizer_should_resolve_probability_description', 0, () => {
      const first = new IssueDetailInfo();
      first.probabilityDesc = '';
      if (first.probabilityObj !== undefined) {
        first.probabilityObj.id = PROBABILITY_ID_MANY_TIMES_A_DAY;
      }
      expect(IssuePayloadNormalizer.resolveProbabilityDesc(first)).assertEqual(PROBABILITY_DESC_MANY_TIMES_A_DAY);

      const second = new IssueDetailInfo();
      second.probabilityDesc = 'custom';
      expect(IssuePayloadNormalizer.resolveProbabilityDesc(second)).assertEqual('custom');

      const third = new IssueDetailInfo();
      third.probabilityObj = undefined;
      third.probabilityDesc = '';
      expect(IssuePayloadNormalizer.resolveProbabilityDesc(third)).assertEqual('');
    });

    it('issue_detail_info_should_support_full_payload', 0, () => {
      const full = new IssueDetailInfo();
      full.issueId = 'ISSUE-1001';
      full.devid = 'UDID-001';
      full.faultTime = '20260101120000';
      full.probability = PROBABILITY_ID_ALWAYS;
      full.probabilityDesc = PROBABILITY_DESC_ALWAYS;
      full.remark = 'remarks';
      full.description = 'screen flickers';
      full.status = STATUS_PROCESSING;
      full.statusDesc = STATUS_PROCESSING;
      full.phone = '12345678901';
      full.hasLogTar = true;
      full.isNew = true;
      full.type = issueTypeList[1];
      full.timeStamp = 1767225600000;
      full.logs = 'logs.tar';

      const attachment = new Attachment();
      attachment.type = ATTACHMENT_TYPE_IMAGE;
      attachment.id = 'att-1';
      attachment.url = 'https://example.com/att-1.png';
      attachment.thumbnail = 'thumb';
      full.attachment = [attachment];

      expect(full.issueId).assertEqual('ISSUE-1001');
      expect(full.devid).assertEqual('UDID-001');
      expect(full.faultTime.length).assertEqual(14);
      expect(full.probability).assertEqual(PROBABILITY_ID_ALWAYS);
      expect(full.probabilityDesc).assertEqual(PROBABILITY_DESC_ALWAYS);
      expect(full.status).assertEqual(STATUS_PROCESSING);
      expect(full.hasLogTar).assertTrue();
      expect(full.isNew).assertTrue();
      expect(full.timeStamp as number).assertLarger(0);
      expect(full.logs).assertEqual('logs.tar');
      expect(IssuePayloadNormalizer.hasDescription(full)).assertTrue();
      expect(IssuePayloadNormalizer.hasAttachments(full)).assertTrue();
      expect(AttachmentValidator.countRemote(full.attachment as Attachment[])).assertEqual(1);
    });

    it('issue_detail_info_mutation_should_not_leak_between_instances', 0, () => {
      const first = new IssueDetailInfo();
      const second = new IssueDetailInfo();
      first.description = 'first';
      first.status = STATUS_RESOLVED;
      first.attachment = [new Attachment()];
      expect(second.description).assertEqual('');
      expect(second.status).assertEqual('');
      expect((second.attachment as Attachment[]).length).assertEqual(0);
      expect(first.description).assertEqual('first');
      expect(IssueStatusValidator.isTerminal(first.status)).assertTrue();
    });

    it('issue_probability_should_round_trip_through_model', 0, () => {
      const full = new IssueDetailInfo();
      if (full.probabilityObj !== undefined) {
        full.probabilityObj.id = PROBABILITY_ID_ONCE_A_DAY;
        full.probability = full.probabilityObj.id;
        full.probabilityDesc = full.probabilityObj.des;
      }
      expect(full.probability).assertEqual(PROBABILITY_ID_ONCE_A_DAY);
      expect(full.probabilityDesc).assertEqual(PROBABILITY_DESC_ONCE_A_DAY);
      expect(probabilityList.indexOf(full.probabilityDesc)).assertEqual(1);
      expect(IssueStatusValidator.isFailure(full.status)).assertFalse();
      expect(IssueStatusValidator.isInProgress(full.status)).assertFalse();
    });

    it('issue_id_should_validate_length_bounds', 0, () => {
      expect(IssueIdValidator.isLengthValid('')).assertFalse();
      expect(IssueIdValidator.isLengthValid('abc')).assertFalse();
      expect(IssueIdValidator.isLengthValid('ISSUE-1')).assertTrue();
      expect(IssueIdValidator.isLengthValid('a'.repeat(IssueIdValidator.MAX_LENGTH))).assertTrue();
      expect(IssueIdValidator.isLengthValid('a'.repeat(IssueIdValidator.MAX_LENGTH + 1))).assertFalse();
    });

    it('issue_id_should_restrict_characters', 0, () => {
      expect(IssueIdValidator.hasAllowedCharacters('ISSUE-2026_01')).assertTrue();
      expect(IssueIdValidator.hasAllowedCharacters('ISSUE 2026')).assertFalse();
      expect(IssueIdValidator.hasAllowedCharacters('ISSUE/2026')).assertFalse();
      expect(IssueIdValidator.hasAllowedCharacters('ISSUE#1')).assertFalse();
      expect(IssueIdValidator.isValid('local draft')).assertFalse();
    });

    it('issue_id_should_recognize_server_and_draft_prefixes', 0, () => {
      expect(IssueIdValidator.isServerId('ISSUE-1001')).assertTrue();
      expect(IssueIdValidator.isServerId('draft-1001')).assertFalse();
      expect(IssueIdValidator.isLocalDraftId('draft-1001')).assertTrue();
      expect(IssueIdValidator.isLocalDraftId('ISSUE-1001')).assertFalse();
      expect(IssueIdValidator.isServerId('ISSUE-')).assertFalse();
    });

    it('issue_list_should_sort_by_time_descending', 0, () => {
      const older = new IssueDetailInfo();
      older.issueId = 'ISSUE-1';
      older.timeStamp = 1000;
      const newer = new IssueDetailInfo();
      newer.issueId = 'ISSUE-2';
      newer.timeStamp = 2000;
      const unordered: IssueDetailInfo[] = [older, newer];
      const sorted = IssueListToolkit.sortByTimeDescending(unordered);
      expect(sorted[0].issueId).assertEqual('ISSUE-2');
      expect(sorted[1].issueId).assertEqual('ISSUE-1');
      expect(unordered[0].issueId).assertEqual('ISSUE-1');
    });

    it('issue_list_should_filter_by_status', 0, () => {
      const items: IssueDetailInfo[] = [];
      for (let i = 0; i < 5; i++) {
        const item = new IssueDetailInfo();
        item.issueId = `ISSUE-${i}`;
        item.status = i % 2 === 0 ? STATUS_PROCESSING : STATUS_RESOLVED;
        items.push(item);
      }
      expect(IssueListToolkit.filterByStatus(items, STATUS_PROCESSING).length).assertEqual(3);
      expect(IssueListToolkit.filterByStatus(items, STATUS_RESOLVED).length).assertEqual(2);
      expect(IssueListToolkit.countByStatus(items, STATUS_PROCESSING)).assertEqual(3);
      expect(IssueListToolkit.countByStatus(items, 'unknown')).assertEqual(0);
    });

    it('issue_list_should_filter_by_type', 0, () => {
      const items: IssueDetailInfo[] = [];
      for (let i = 0; i < issueTypeList.length; i++) {
        const item = new IssueDetailInfo();
        item.issueId = `ISSUE-T${i}`;
        item.type = issueTypeList[i];
        items.push(item);
      }
      expect(items.length).assertEqual(4);
      for (let i = 0; i < issueTypeList.length; i++) {
        expect(IssueListToolkit.filterByType(items, issueTypeList[i]).length).assertEqual(1);
      }
      expect(IssueListToolkit.filterByType(items, 'unsupported').length).assertEqual(0);
    });

    it('issue_list_should_find_by_id_and_deduplicate', 0, () => {
      const first = new IssueDetailInfo();
      first.issueId = 'ISSUE-1';
      const duplicate = new IssueDetailInfo();
      duplicate.issueId = 'ISSUE-1';
      const second = new IssueDetailInfo();
      second.issueId = 'ISSUE-2';
      const items: IssueDetailInfo[] = [first, duplicate, second];
      expect(IssueListToolkit.findById(items, 'ISSUE-1') === first).assertTrue();
      expect(IssueListToolkit.findById(items, 'ISSUE-9') === undefined).assertTrue();
      expect(IssueListToolkit.uniqueIds(items).length).assertEqual(2);
    });

    it('issue_merge_should_keep_remote_priority', 0, () => {
      const local = new IssueDetailInfo();
      local.issueId = 'ISSUE-1';
      local.description = 'local';
      const remote = new IssueDetailInfo();
      remote.issueId = 'ISSUE-1';
      remote.description = 'remote';
      const localOnly = new IssueDetailInfo();
      localOnly.issueId = 'ISSUE-2';
      const merged = IssueMergeToolkit.merge([local, localOnly], [remote]);
      expect(merged.length).assertEqual(2);
      expect(merged[0].description).assertEqual('remote');
      expect(merged[1].issueId).assertEqual('ISSUE-2');
    });

    it('issue_merge_should_replace_and_remove_by_id', 0, () => {
      const items: IssueDetailInfo[] = [];
      for (let i = 0; i < 3; i++) {
        const item = new IssueDetailInfo();
        item.issueId = `ISSUE-${i}`;
        items.push(item);
      }
      const updated = new IssueDetailInfo();
      updated.issueId = 'ISSUE-1';
      updated.description = 'updated';
      expect(IssueMergeToolkit.replaceById(items, updated)).assertTrue();
      expect(items[1].description).assertEqual('updated');
      const missing = new IssueDetailInfo();
      missing.issueId = 'ISSUE-9';
      expect(IssueMergeToolkit.replaceById(items, missing)).assertFalse();
      expect(IssueMergeToolkit.removeById(items, 'ISSUE-1')).assertEqual(1);
      expect(items.length).assertEqual(2);
      expect(IssueMergeToolkit.removeById(items, 'ISSUE-1')).assertEqual(0);
    });

    it('issue_merge_should_select_pending_drafts', 0, () => {
      const pending = new IssueDetailInfo();
      pending.isNew = true;
      const synced = new IssueDetailInfo();
      synced.isNew = false;
      const local: IssueDetailInfo[] = [pending, synced];
      expect(IssueMergeToolkit.pendingOnly(local).length).assertEqual(1);
      expect(IssueMergeToolkit.pendingOnly(local)[0] === pending).assertTrue();
      expect(IssueMergeToolkit.pendingOnly([]).length).assertEqual(0);
    });

    it('status_transition_should_follow_allowed_table', 0, () => {
      expect(IssueStatusTransition.canTransition(STATUS_WAIT_CONFIRM, STATUS_PROCESSING)).assertTrue();
      expect(IssueStatusTransition.canTransition(STATUS_PROCESSING, STATUS_RESOLVED)).assertTrue();
      expect(IssueStatusTransition.canTransition(STATUS_PROCESSING, STATUS_SUSPENDED)).assertTrue();
      expect(IssueStatusTransition.canTransition(STATUS_RESOLVED, STATUS_PROCESSING)).assertFalse();
      expect(IssueStatusTransition.canTransition(STATUS_NOT_ISSUE, STATUS_PROCESSING)).assertFalse();
    });

    it('status_transition_should_expose_next_states', 0, () => {
      const next = IssueStatusTransition.nextOf(STATUS_PROCESSING);
      expect(next.length).assertEqual(2);
      expect(next.includes(STATUS_RESOLVED)).assertTrue();
      expect(next.includes(STATUS_SUSPENDED)).assertTrue();
      expect(IssueStatusTransition.nextOf(STATUS_RESOLVED).length).assertEqual(0);
      expect(IssueStatusTransition.nextOf(STATUS_UPLOADING).length).assertEqual(2);
    });

    it('status_transition_should_mark_retryable_failures', 0, () => {
      expect(IssueStatusTransition.isRetryable(STATUS_UPLOAD_FAILED)).assertTrue();
      expect(IssueStatusTransition.isRetryable(STATUS_SUBMIT_FAILED)).assertTrue();
      expect(IssueStatusTransition.isRetryable(STATUS_UPLOADING)).assertFalse();
      expect(IssueStatusTransition.isRetryable(STATUS_RESOLVED)).assertFalse();
      expect(IssueStatusTransition.isRetryable('')).assertFalse();
    });

    it('attachment_collection_should_enforce_limit', 0, () => {
      const collection = new AttachmentCollection(2);
      const first = new Attachment();
      first.type = ATTACHMENT_TYPE_IMAGE;
      const second = new Attachment();
      second.type = ATTACHMENT_TYPE_VIDEO;
      const third = new Attachment();
      third.type = ATTACHMENT_TYPE_FILE;
      expect(collection.add(first)).assertTrue();
      expect(collection.add(second)).assertTrue();
      expect(collection.isFull()).assertTrue();
      expect(collection.add(third)).assertFalse();
      expect(collection.size()).assertEqual(2);
      expect(collection.countByType(ATTACHMENT_TYPE_IMAGE)).assertEqual(1);
    });

    it('attachment_collection_should_remove_and_clear', 0, () => {
      const collection = new AttachmentCollection(3);
      for (let i = 0; i < 3; i++) {
        const attachment = new Attachment();
        attachment.type = ATTACHMENT_TYPE_IMAGE;
        attachment.id = `att-${i}`;
        collection.add(attachment);
      }
      expect(collection.isFull()).assertTrue();
      expect(collection.removeAt(-1)).assertFalse();
      expect(collection.removeAt(3)).assertFalse();
      expect(collection.removeAt(1)).assertTrue();
      expect(collection.size()).assertEqual(2);
      expect(collection.getItems()[1].id).assertEqual('att-2');
      collection.clear();
      expect(collection.size()).assertEqual(0);
      expect(collection.isFull()).assertFalse();
    });

    it('time_toolkit_should_format_durations', 0, () => {
      expect(IssueTimeToolkit.formatDuration(-1)).assertEqual('0s');
      expect(IssueTimeToolkit.formatDuration(0)).assertEqual('0s');
      expect(IssueTimeToolkit.formatDuration(999)).assertEqual('0s');
      expect(IssueTimeToolkit.formatDuration(1000)).assertEqual('1s');
      expect(IssueTimeToolkit.formatDuration(65000)).assertEqual('65s');
    });

    it('time_toolkit_should_format_clock_values', 0, () => {
      expect(IssueTimeToolkit.pad(0)).assertEqual('00');
      expect(IssueTimeToolkit.pad(9)).assertEqual('09');
      expect(IssueTimeToolkit.pad(10)).assertEqual('10');
      expect(IssueTimeToolkit.formatClock(0)).assertEqual('00:00:00');
      expect(IssueTimeToolkit.formatClock(3661)).assertEqual('01:01:01');
      expect(IssueTimeToolkit.formatClock(-5)).assertEqual('00:00:00');
    });

    it('time_toolkit_should_compare_timestamps', 0, () => {
      const first = new IssueDetailInfo();
      first.timeStamp = 1000;
      const second = new IssueDetailInfo();
      second.timeStamp = 2000;
      const unset = new IssueDetailInfo();
      expect(IssueTimeToolkit.newerThan(second, first)).assertTrue();
      expect(IssueTimeToolkit.newerThan(first, second)).assertFalse();
      expect(IssueTimeToolkit.newerThan(unset, first)).assertFalse();
      expect(IssueTimeToolkit.isTimestampValid(1)).assertTrue();
      expect(IssueTimeToolkit.isTimestampValid(0)).assertFalse();
    });

    it('issue_list_sort_should_keep_equal_timestamps_stable', 0, () => {
      const first = new IssueDetailInfo();
      first.issueId = 'ISSUE-A';
      first.timeStamp = 1000;
      const second = new IssueDetailInfo();
      second.issueId = 'ISSUE-B';
      second.timeStamp = 1000;
      const sorted = IssueListToolkit.sortByTimeDescending([first, second]);
      expect(sorted.length).assertEqual(2);
      expect(sorted[0].issueId).assertEqual('ISSUE-A');
      expect(sorted[1].issueId).assertEqual('ISSUE-B');
    });

    it('issue_list_should_handle_empty_collections', 0, () => {
      const empty: IssueDetailInfo[] = [];
      expect(IssueListToolkit.sortByTimeDescending(empty).length).assertEqual(0);
      expect(IssueListToolkit.filterByStatus(empty, STATUS_RESOLVED).length).assertEqual(0);
      expect(IssueListToolkit.filterByType(empty, issueTypeList[0]).length).assertEqual(0);
      expect(IssueListToolkit.uniqueIds(empty).length).assertEqual(0);
      expect(IssueListToolkit.findById(empty, 'ISSUE-1') === undefined).assertTrue();
      expect(IssueMergeToolkit.merge(empty, empty).length).assertEqual(0);
    });

    it('status_transition_table_should_be_well_formed', 0, () => {
      expect(IssueStatusTransition.ALLOWED.length).assertEqual(7);
      for (let i = 0; i < IssueStatusTransition.ALLOWED.length; i++) {
        expect(IssueStatusTransition.ALLOWED[i].length).assertEqual(2);
        expect(IssueStatusTransition.ALLOWED[i][0] === IssueStatusTransition.ALLOWED[i][1]).assertFalse();
        expect(statusList.includes(IssueStatusTransition.ALLOWED[i][0])).assertTrue();
        expect(statusList.includes(IssueStatusTransition.ALLOWED[i][1])).assertTrue();
      }
    });

    it('attachment_collection_should_start_empty', 0, () => {
      const collection = new AttachmentCollection(4);
      expect(collection.size()).assertEqual(0);
      expect(collection.isFull()).assertFalse();
      expect(collection.getItems().length).assertEqual(0);
      expect(collection.countByType(ATTACHMENT_TYPE_IMAGE)).assertEqual(0);
      expect(collection.removeAt(0)).assertFalse();
      const snapshot = collection.getItems();
      snapshot.push(new Attachment());
      expect(collection.size()).assertEqual(0);
    });

    it('time_toolkit_should_format_large_clock_values', 0, () => {
      expect(IssueTimeToolkit.formatClock(86399)).assertEqual('23:59:59');
      expect(IssueTimeToolkit.formatClock(86400)).assertEqual('24:00:00');
      expect(IssueTimeToolkit.formatDuration(3600000)).assertEqual('3600s');
      expect(IssueTimeToolkit.isTimestampValid(1767225600000)).assertTrue();
    });

    it('issue_id_validator_should_accept_draft_and_server_formats', 0, () => {
      expect(IssueIdValidator.isValid('ISSUE-20260101-0001')).assertTrue();
      expect(IssueIdValidator.isValid('draft-20260101-0001')).assertTrue();
      expect(IssueIdValidator.isLocalDraftId('draft-20260101-0001')).assertTrue();
      expect(IssueIdValidator.isServerId('ISSUE-20260101-0001')).assertTrue();
      expect(IssueIdValidator.isValid('-')).assertFalse();
    });

    it('attachment_collection_should_allow_refill_after_clear', 0, () => {
      const collection = new AttachmentCollection(1);
      const attachment = new Attachment();
      attachment.type = ATTACHMENT_TYPE_FILE;
      expect(collection.add(attachment)).assertTrue();
      expect(collection.isFull()).assertTrue();
      collection.clear();
      expect(collection.isFull()).assertFalse();
      expect(collection.add(attachment)).assertTrue();
      expect(collection.size()).assertEqual(1);
    });

    it('issue_status_transition_should_reject_unknown_states', 0, () => {
      expect(IssueStatusTransition.nextOf('unknown').length).assertEqual(0);
      expect(IssueStatusTransition.canTransition('unknown', STATUS_RESOLVED)).assertFalse();
      expect(IssueStatusTransition.canTransition(STATUS_RESOLVED, 'unknown')).assertFalse();
      expect(IssueStatusTransition.isRetryable('unknown')).assertFalse();
    });

    it('issue_id_validator_limits_should_be_stable', 0, () => {
      expect(IssueIdValidator.MIN_LENGTH).assertEqual(6);
      expect(IssueIdValidator.MAX_LENGTH).assertEqual(64);
      expect(IssueIdValidator.MIN_LENGTH).assertLess(IssueIdValidator.MAX_LENGTH);
    });
  });
}

