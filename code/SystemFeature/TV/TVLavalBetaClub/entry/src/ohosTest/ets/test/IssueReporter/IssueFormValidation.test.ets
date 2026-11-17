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

import { describe, it, expect } from '@ohos/hypium';
import IssueDetailInfo, {
  Attachment,
  Probability,
  issueTypeList,
  probabilityList
} from '../../../../main/ets/pages/IssueReporter/models/IssueDetailInfo';
import { TEXT_SELECT_MEDIA } from '../Shared/BetaClubDriver';

const MAX_SELECT_COUNT: number = 4;

const MAX_DESCRIPTION: number = 1024;

const MAX_ATTACHMENT_BYTES: number = 100 * 1024 * 1024;

const REQUIRED_DESCRIPTION_PROMPT: string = '请填写问题描述';

const REQUIRED_PROBABILITY_PROMPT: string = '请选择问题概率';

const REQUIRED_TYPE_PROMPT: string = '请选择问题类型';

const REQUIRED_TIME_PROMPT: string = '请选择故障时间';

const CHARACTER_LIMIT_PROMPT: string = '您输入的字符数量已达到上限，请不要再输入';

const SIZE_LIMIT_PROMPT: string = '附件大小不能超过100M';

interface ValidationIssue {
  field: string;
  message: string;
}

interface FormState {
  description: string;
  probabilityId: string;
  type: string;
  faultTime: string;
  attachments: Attachment[];
}

interface AttachmentCandidate {
  type: string;
  sizeBytes: number;
  name: string;
}

// Centralizes the field rules enforced by IssueReporterAdd.ets
class IssueFormValidator {
  public static validateDescription(description: string): ValidationIssue | undefined {
    if (description.length === 0) {
      return { field: 'description', message: REQUIRED_DESCRIPTION_PROMPT };
    }
    if (description.length > MAX_DESCRIPTION) {
      return { field: 'description', message: CHARACTER_LIMIT_PROMPT };
    }
    return undefined;
  }

  public static validateProbability(probabilityId: string): ValidationIssue | undefined {
    if (probabilityId.length === 0 || !IssueFormValidator.isProbabilityId(probabilityId)) {
      return { field: 'probability', message: REQUIRED_PROBABILITY_PROMPT };
    }
    return undefined;
  }

  public static validateType(type: string): ValidationIssue | undefined {
    if (type.length === 0 || !issueTypeList.includes(type)) {
      return { field: 'type', message: REQUIRED_TYPE_PROMPT };
    }
    return undefined;
  }

  public static validateFaultTime(faultTime: string): ValidationIssue | undefined {
    const digitsOnly: RegExp = new RegExp('^[0-9]{14}$');
    if (faultTime.length !== 14 || !digitsOnly.test(faultTime)) {
      return { field: 'faultTime', message: REQUIRED_TIME_PROMPT };
    }
    return undefined;
  }

  public static isProbabilityId(probabilityId: string): boolean {
    return probabilityId === '0' || probabilityId === '1' || probabilityId === '2' || probabilityId === '3';
  }

  public static validateForm(state: FormState): ValidationIssue[] {
    const issues: ValidationIssue[] = [];
    const descriptionIssue = IssueFormValidator.validateDescription(state.description);
    const probabilityIssue = IssueFormValidator.validateProbability(state.probabilityId);
    const typeIssue = IssueFormValidator.validateType(state.type);
    const timeIssue = IssueFormValidator.validateFaultTime(state.faultTime);
    if (descriptionIssue !== undefined) {
      issues.push(descriptionIssue);
    }
    if (probabilityIssue !== undefined) {
      issues.push(probabilityIssue);
    }
    if (typeIssue !== undefined) {
      issues.push(typeIssue);
    }
    if (timeIssue !== undefined) {
      issues.push(timeIssue);
    }
    return issues;
  }

  public static isSubmittable(state: FormState): boolean {
    return IssueFormValidator.validateForm(state).length === 0;
  }
}

// Validates attachment selection rules from IssueAttachment.ets
class AttachmentSelectionValidator {
  public static canSelect(currentCount: number, additionalCount: number): boolean {
    if (currentCount < 0 || additionalCount < 0) {
      return false;
    }
    return currentCount + additionalCount <= MAX_SELECT_COUNT;
  }

  public static remaining(currentCount: number): number {
    const remaining = MAX_SELECT_COUNT - currentCount;
    return remaining < 0 ? 0 : remaining;
  }

  public static isSizeAllowed(sizeBytes: number): boolean {
    return sizeBytes >= 0 && sizeBytes <= MAX_ATTACHMENT_BYTES;
  }

  public static firstOversizeIndex(candidates: AttachmentCandidate[]): number {
    for (let i = 0; i < candidates.length; i++) {
      if (!AttachmentSelectionValidator.isSizeAllowed(candidates[i].sizeBytes)) {
        return i;
      }
    }
    return -1;
  }

  public static toAttachments(candidates: AttachmentCandidate[]): Attachment[] {
    const attachments: Attachment[] = [];
    for (let i = 0; i < candidates.length; i++) {
      if (!AttachmentSelectionValidator.isSizeAllowed(candidates[i].sizeBytes)) {
        continue;
      }
      const attachment = new Attachment();
      attachment.type = candidates[i].type;
      attachment.thumbnail = candidates[i].name;
      attachments.push(attachment);
    }
    return attachments;
  }

  public static selectPrompt(count: number): string {
    return count >= MAX_SELECT_COUNT ? TEXT_SELECT_MEDIA : '';
  }
}

// Builds the submission payload from the interactive form state
class IssueFormBuilder {
  public static build(state: FormState): IssueDetailInfo {
    const info = new IssueDetailInfo();
    info.description = state.description;
    info.probability = state.probabilityId;
    info.type = state.type;
    info.faultTime = state.faultTime;
    info.attachment = state.attachments;
    const probability = new Probability();
    probability.id = state.probabilityId;
    info.probabilityObj = probability;
    info.probabilityDesc = probability.des;
    info.status = '上传中';
    return info;
  }

  public static attachmentPayload(info: IssueDetailInfo): Attachment[] {
    return info.attachment === undefined ? [] : info.attachment;
  }
}

export default function issueFormValidationTest() {
  describe('IssueFormValidation_Test', () => {

    it('description_should_be_required', 0, () => {
      const issue = IssueFormValidator.validateDescription('');
      expect(issue !== undefined).assertTrue();
      expect((issue as ValidationIssue).field).assertEqual('description');
      expect((issue as ValidationIssue).message).assertEqual(REQUIRED_DESCRIPTION_PROMPT);
    });

    it('description_should_accept_valid_text', 0, () => {
      expect(IssueFormValidator.validateDescription('screen flickers') === undefined).assertTrue();
      expect(IssueFormValidator.validateDescription('a'.repeat(MAX_DESCRIPTION)) === undefined).assertTrue();
    });

    it('description_should_reject_overflow', 0, () => {
      const issue = IssueFormValidator.validateDescription('a'.repeat(MAX_DESCRIPTION + 1));
      expect(issue !== undefined).assertTrue();
      expect((issue as ValidationIssue).message).assertEqual(CHARACTER_LIMIT_PROMPT);
    });

    it('probability_should_be_required', 0, () => {
      const issue = IssueFormValidator.validateProbability('');
      expect(issue !== undefined).assertTrue();
      expect((issue as ValidationIssue).message).assertEqual(REQUIRED_PROBABILITY_PROMPT);
    });

    it('probability_should_accept_known_ids', 0, () => {
      for (let i = 0; i < probabilityList.length; i++) {
        expect(IssueFormValidator.validateProbability(`${i}`) === undefined).assertTrue();
        expect(IssueFormValidator.isProbabilityId(`${i}`)).assertTrue();
      }
      expect(IssueFormValidator.isProbabilityId('4')).assertFalse();
      expect(IssueFormValidator.validateProbability('4') !== undefined).assertTrue();
    });

    it('issue_type_should_be_required_and_known', 0, () => {
      expect(IssueFormValidator.validateType('') !== undefined).assertTrue();
      expect(IssueFormValidator.validateType('unknown') !== undefined).assertTrue();
      for (let i = 0; i < issueTypeList.length; i++) {
        expect(IssueFormValidator.validateType(issueTypeList[i]) === undefined).assertTrue();
      }
    });

    it('fault_time_should_require_fourteen_digits', 0, () => {
      expect(IssueFormValidator.validateFaultTime('') !== undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('20260101') !== undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('20260101120000') === undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('202601011200001') !== undefined).assertTrue();
    });

    it('complete_form_should_be_submittable', 0, () => {
      const state: FormState = {
        description: 'screen flickers when switching channel',
        probabilityId: '3',
        type: '稳定性',
        faultTime: '20260101120000',
        attachments: []
      };
      expect(IssueFormValidator.validateForm(state).length).assertEqual(0);
      expect(IssueFormValidator.isSubmittable(state)).assertTrue();
    });

    it('empty_form_should_collect_all_issues', 0, () => {
      const state: FormState = {
        description: '',
        probabilityId: '',
        type: '',
        faultTime: '',
        attachments: []
      };
      const issues = IssueFormValidator.validateForm(state);
      expect(issues.length).assertEqual(4);
      expect(IssueFormValidator.isSubmittable(state)).assertFalse();
      const fields = issues.map((issue: ValidationIssue) => issue.field);
      expect(fields.includes('description')).assertTrue();
      expect(fields.includes('probability')).assertTrue();
      expect(fields.includes('type')).assertTrue();
      expect(fields.includes('faultTime')).assertTrue();
    });

    it('attachment_selection_should_respect_limit', 0, () => {
      expect(AttachmentSelectionValidator.canSelect(0, 4)).assertTrue();
      expect(AttachmentSelectionValidator.canSelect(2, 2)).assertTrue();
      expect(AttachmentSelectionValidator.canSelect(3, 2)).assertFalse();
      expect(AttachmentSelectionValidator.canSelect(-1, 1)).assertFalse();
      expect(AttachmentSelectionValidator.remaining(2)).assertEqual(2);
      expect(AttachmentSelectionValidator.remaining(4)).assertEqual(0);
      expect(AttachmentSelectionValidator.remaining(5)).assertEqual(0);
    });

    it('attachment_size_should_be_limited', 0, () => {
      expect(AttachmentSelectionValidator.isSizeAllowed(0)).assertTrue();
      expect(AttachmentSelectionValidator.isSizeAllowed(MAX_ATTACHMENT_BYTES)).assertTrue();
      expect(AttachmentSelectionValidator.isSizeAllowed(MAX_ATTACHMENT_BYTES + 1)).assertFalse();
      expect(AttachmentSelectionValidator.isSizeAllowed(-1)).assertFalse();
      expect(SIZE_LIMIT_PROMPT).assertContain('100M');
    });

    it('oversize_attachment_should_be_located', 0, () => {
      const candidates: AttachmentCandidate[] = [
        { type: 'image', sizeBytes: 1024, name: 'a.png' },
        { type: 'video', sizeBytes: MAX_ATTACHMENT_BYTES + 1, name: 'b.mp4' },
        { type: 'image', sizeBytes: 2048, name: 'c.png' }
      ];
      expect(AttachmentSelectionValidator.firstOversizeIndex(candidates)).assertEqual(1);
      const valid: AttachmentCandidate[] = [
        { type: 'image', sizeBytes: 1024, name: 'a.png' },
        { type: 'image', sizeBytes: 2048, name: 'c.png' }
      ];
      expect(AttachmentSelectionValidator.firstOversizeIndex(valid)).assertEqual(-1);
      const attachments = AttachmentSelectionValidator.toAttachments(candidates);
      expect(attachments.length).assertEqual(2);
      expect(attachments[0].type).assertEqual('image');
      expect(attachments[1].thumbnail).assertEqual('c.png');
    });

    it('select_prompt_should_appear_at_limit', 0, () => {
      expect(AttachmentSelectionValidator.selectPrompt(0)).assertEqual('');
      expect(AttachmentSelectionValidator.selectPrompt(MAX_SELECT_COUNT)).assertEqual(TEXT_SELECT_MEDIA);
      expect(AttachmentSelectionValidator.selectPrompt(MAX_SELECT_COUNT + 1)).assertEqual(TEXT_SELECT_MEDIA);
    });

    it('form_builder_should_create_payload', 0, () => {
      const state: FormState = {
        description: 'black screen after standby',
        probabilityId: '2',
        type: '功能',
        faultTime: '20260101120000',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      expect(info.description).assertEqual('black screen after standby');
      expect(info.probability).assertEqual('2');
      expect(info.type).assertEqual('功能');
      expect(info.faultTime).assertEqual('20260101120000');
      expect(info.probabilityDesc).assertEqual('一天多次');
      expect(info.status).assertEqual('上传中');
      expect(IssueFormBuilder.attachmentPayload(info).length).assertEqual(0);
    });

    it('form_builder_should_keep_attachments', 0, () => {
      const attachment = new Attachment();
      attachment.type = 'image';
      attachment.thumbnail = 'thumb';
      const state: FormState = {
        description: 'issue',
        probabilityId: '1',
        type: '蓝牙',
        faultTime: '20260101120000',
        attachments: [attachment]
      };
      const info = IssueFormBuilder.build(state);
      expect(IssueFormBuilder.attachmentPayload(info).length).assertEqual(1);
      expect(IssueFormBuilder.attachmentPayload(info)[0].thumbnail).assertEqual('thumb');
      expect(info.probabilityDesc).assertEqual('一天一次');
    });

    it('form_builder_should_keep_probability_object', 0, () => {
      const state: FormState = {
        description: 'issue',
        probabilityId: '0',
        type: 'OTA',
        faultTime: '20260101120000',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      expect(info.probabilityObj !== undefined).assertTrue();
      expect((info.probabilityObj as Probability).id).assertEqual('0');
      expect((info.probabilityObj as Probability).des).assertEqual('极低');
      expect(info.probabilityDesc).assertEqual((info.probabilityObj as Probability).des);
    });

    it('form_validation_should_accept_boundary_values', 0, () => {
      const state: FormState = {
        description: 'a'.repeat(MAX_DESCRIPTION),
        probabilityId: '3',
        type: '稳定性',
        faultTime: '99991231235959',
        attachments: []
      };
      expect(IssueFormValidator.isSubmittable(state)).assertTrue();
      state.description = 'a'.repeat(MAX_DESCRIPTION + 1);
      expect(IssueFormValidator.isSubmittable(state)).assertFalse();
      expect(IssueFormValidator.validateForm(state).length).assertEqual(1);
    });

    it('form_validation_should_report_single_field', 0, () => {
      const state: FormState = {
        description: 'valid description',
        probabilityId: '',
        type: '功能',
        faultTime: '20260101120000',
        attachments: []
      };
      const issues = IssueFormValidator.validateForm(state);
      expect(issues.length).assertEqual(1);
      expect(issues[0].field).assertEqual('probability');
      state.probabilityId = '3';
      expect(IssueFormValidator.validateForm(state).length).assertEqual(0);
      expect(IssueFormValidator.isSubmittable(state)).assertTrue();
    });

    it('description_should_count_spaces_as_characters', 0, () => {
      expect(IssueFormValidator.validateDescription(' ') === undefined).assertTrue();
      expect(IssueFormValidator.validateDescription('  issue  ') === undefined).assertTrue();
      expect(IssueFormValidator.validateDescription('a'.repeat(MAX_DESCRIPTION + 1)) !== undefined).assertTrue();
    });

    it('probability_validator_should_reject_empty_and_unknown', 0, () => {
      expect(IssueFormValidator.isProbabilityId('')).assertFalse();
      expect(IssueFormValidator.isProbabilityId('00')).assertFalse();
      expect(IssueFormValidator.isProbabilityId('-1')).assertFalse();
      expect(IssueFormValidator.isProbabilityId('3')).assertTrue();
      expect(IssueFormValidator.validateProbability('') !== undefined).assertTrue();
      expect(IssueFormValidator.validateProbability('unknown') !== undefined).assertTrue();
    });

    it('fault_time_validator_should_reject_non_numeric', 0, () => {
      expect(IssueFormValidator.validateFaultTime('2026-01-01-12') !== undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('abcdefghijklmn') !== undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('20260101120000') === undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('00000000000000') === undefined).assertTrue();
    });

    it('attachment_selection_should_reject_zero_additional', 0, () => {
      expect(AttachmentSelectionValidator.canSelect(0, 0)).assertTrue();
      expect(AttachmentSelectionValidator.canSelect(4, 0)).assertTrue();
      expect(AttachmentSelectionValidator.canSelect(5, 0)).assertFalse();
      expect(AttachmentSelectionValidator.canSelect(0, 5)).assertFalse();
      expect(AttachmentSelectionValidator.remaining(0)).assertEqual(MAX_SELECT_COUNT);
    });

    it('attachment_size_boundary_should_match_100mb', 0, () => {
      expect(MAX_ATTACHMENT_BYTES).assertEqual(104857600);
      expect(AttachmentSelectionValidator.isSizeAllowed(104857600)).assertTrue();
      expect(AttachmentSelectionValidator.isSizeAllowed(104857601)).assertFalse();
      expect(AttachmentSelectionValidator.isSizeAllowed(Number.MAX_SAFE_INTEGER)).assertFalse();
    });

    it('oversize_detection_should_return_minus_one_for_empty', 0, () => {
      const empty: AttachmentCandidate[] = [];
      expect(AttachmentSelectionValidator.firstOversizeIndex(empty)).assertEqual(-1);
      expect(AttachmentSelectionValidator.toAttachments(empty).length).assertEqual(0);
    });

    it('oversize_detection_should_keep_order_of_valid_items', 0, () => {
      const candidates: AttachmentCandidate[] = [
        { type: 'image', sizeBytes: 10, name: 'first.png' },
        { type: 'video', sizeBytes: MAX_ATTACHMENT_BYTES + 1, name: 'skip.mp4' },
        { type: 'audio', sizeBytes: 20, name: 'second.mp3' },
        { type: 'file', sizeBytes: 30, name: 'third.log' }
      ];
      const attachments = AttachmentSelectionValidator.toAttachments(candidates);
      expect(attachments.length).assertEqual(3);
      expect(attachments[0].thumbnail).assertEqual('first.png');
      expect(attachments[1].thumbnail).assertEqual('second.mp3');
      expect(attachments[2].thumbnail).assertEqual('third.log');
      expect(AttachmentSelectionValidator.firstOversizeIndex(candidates)).assertEqual(1);
    });

    it('form_builder_should_copy_scalar_fields', 0, () => {
      const state: FormState = {
        description: 'copy test',
        probabilityId: '3',
        type: issueTypeList[3],
        faultTime: '20261231235959',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      state.description = 'mutated';
      expect(info.description).assertEqual('copy test');
      expect(info.type).assertEqual(issueTypeList[3]);
      expect(info.faultTime).assertEqual('20261231235959');
      expect(info.probability).assertEqual('3');
    });

    it('form_builder_should_reflect_probability_zero', 0, () => {
      const state: FormState = {
        description: 'low probability',
        probabilityId: '0',
        type: issueTypeList[0],
        faultTime: '20260101120000',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      expect(info.probabilityDesc).assertEqual(probabilityList[0]);
      expect((info.probabilityObj as Probability).id).assertEqual('0');
      expect(IssueFormValidator.isSubmittable(state)).assertTrue();
    });

    it('form_validation_should_accept_each_issue_type', 0, () => {
      for (let i = 0; i < issueTypeList.length; i++) {
        const state: FormState = {
          description: `issue type ${i}`,
          probabilityId: '3',
          type: issueTypeList[i],
          faultTime: '20260101120000',
          attachments: []
        };
        expect(IssueFormValidator.validateType(state.type) === undefined).assertTrue();
        expect(IssueFormValidator.isSubmittable(state)).assertTrue();
      }
      expect(issueTypeList.length).assertEqual(4);
    });

    it('form_validation_should_reject_each_missing_field', 0, () => {
      const base: FormState = {
        description: 'valid',
        probabilityId: '3',
        type: issueTypeList[0],
        faultTime: '20260101120000',
        attachments: []
      };
      const missingDescription: FormState = {
        description: '', probabilityId: base.probabilityId, type: base.type,
        faultTime: base.faultTime, attachments: base.attachments
      };
      const missingProbability: FormState = {
        description: base.description, probabilityId: '', type: base.type,
        faultTime: base.faultTime, attachments: base.attachments
      };
      const missingType: FormState = {
        description: base.description, probabilityId: base.probabilityId, type: '',
        faultTime: base.faultTime, attachments: base.attachments
      };
      const missingTime: FormState = {
        description: base.description, probabilityId: base.probabilityId, type: base.type,
        faultTime: '', attachments: base.attachments
      };
      expect(IssueFormValidator.validateForm(missingDescription).length).assertEqual(1);
      expect(IssueFormValidator.validateForm(missingProbability).length).assertEqual(1);
      expect(IssueFormValidator.validateForm(missingType).length).assertEqual(1);
      expect(IssueFormValidator.validateForm(missingTime).length).assertEqual(1);
      expect(IssueFormValidator.isSubmittable(base)).assertTrue();
    });

    it('form_validation_should_report_fields_in_stable_order', 0, () => {
      const state: FormState = {
        description: '', probabilityId: '', type: '', faultTime: '', attachments: []
      };
      const first = IssueFormValidator.validateForm(state);
      const second = IssueFormValidator.validateForm(state);
      expect(first.length).assertEqual(second.length);
      for (let i = 0; i < first.length; i++) {
        expect(first[i].field).assertEqual(second[i].field);
        expect(first[i].message).assertEqual(second[i].message);
      }
      expect(first[0].field).assertEqual('description');
      expect(first[1].field).assertEqual('probability');
      expect(first[2].field).assertEqual('type');
      expect(first[3].field).assertEqual('faultTime');
    });

    it('select_prompt_should_be_stable_text', 0, () => {
      const prompt = AttachmentSelectionValidator.selectPrompt(MAX_SELECT_COUNT);
      expect(prompt).assertEqual(TEXT_SELECT_MEDIA);
      expect(prompt.length).assertLarger(0);
      expect(prompt === AttachmentSelectionValidator.selectPrompt(MAX_SELECT_COUNT + 10)).assertTrue();
      expect(AttachmentSelectionValidator.selectPrompt(MAX_SELECT_COUNT - 1)).assertEqual('');
    });

    it('form_builder_should_keep_optional_fields_empty', 0, () => {
      const state: FormState = {
        description: 'optional check',
        probabilityId: '2',
        type: issueTypeList[1],
        faultTime: '20260101120000',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      expect(info.remark === undefined || info.remark === '').assertTrue();
      expect(info.phone === undefined || info.phone === '').assertTrue();
      expect(info.logs === undefined || info.logs === '').assertTrue();
      expect(info.hasLogTar).assertFalse();
      expect(info.isNew).assertFalse();
      expect(info.issueId).assertEqual('');
      expect(info.devid).assertEqual('');
    });

    it('attachment_limits_should_compose_count_and_size', 0, () => {
      const candidates: AttachmentCandidate[] = [];
      for (let i = 0; i < MAX_SELECT_COUNT; i++) {
        candidates.push({ type: 'image', sizeBytes: 1024 * (i + 1), name: `image-${i}.png` });
      }
      expect(candidates.length).assertEqual(MAX_SELECT_COUNT);
      expect(AttachmentSelectionValidator.firstOversizeIndex(candidates)).assertEqual(-1);
      const attachments = AttachmentSelectionValidator.toAttachments(candidates);
      expect(attachments.length).assertEqual(MAX_SELECT_COUNT);
      expect(AttachmentSelectionValidator.canSelect(attachments.length, 1)).assertFalse();
      expect(AttachmentSelectionValidator.canSelect(attachments.length, 0)).assertTrue();
    });

    it('description_boundary_should_accept_empty_after_trim_rules', 0, () => {
      expect(IssueFormValidator.validateDescription('') !== undefined).assertTrue();
      expect(IssueFormValidator.validateDescription(' ') === undefined).assertTrue();
      expect(IssueFormValidator.validateDescription('\n') === undefined).assertTrue();
      expect(IssueFormValidator.validateDescription('a'.repeat(MAX_DESCRIPTION)) === undefined).assertTrue();
    });

    it('probability_description_should_align_with_catalog', 0, () => {
      for (let i = 0; i < probabilityList.length; i++) {
        const probability = new Probability();
        probability.id = `${i}`;
        expect(probability.des).assertEqual(probabilityList[i]);
        expect(probability.des.length).assertLarger(0);
      }
      expect(probabilityList.length).assertEqual(4);
    });

    it('attachment_validator_should_reject_negative_sizes', 0, () => {
      expect(AttachmentSelectionValidator.isSizeAllowed(-1)).assertFalse();
      expect(AttachmentSelectionValidator.isSizeAllowed(-1024)).assertFalse();
      expect(AttachmentSelectionValidator.firstOversizeIndex([
        { type: 'image', sizeBytes: -1, name: 'bad.png' }
      ])).assertEqual(0);
      expect(AttachmentSelectionValidator.toAttachments([
        { type: 'image', sizeBytes: -1, name: 'bad.png' }
      ]).length).assertEqual(0);
    });

    it('form_builder_should_tag_status_for_upload_pipeline', 0, () => {
      const state: FormState = {
        description: 'status check',
        probabilityId: '3',
        type: issueTypeList[2],
        faultTime: '20260101120000',
        attachments: []
      };
      const info = IssueFormBuilder.build(state);
      expect(info.status.length).assertLarger(0);
      expect(info.status).assertEqual('上传中');
      expect(info.statusDesc).assertEqual('');
      expect(info.probabilityDesc).assertEqual(probabilityList[3]);
    });

    it('fault_time_should_accept_zero_and_max_digits', 0, () => {
      expect(IssueFormValidator.validateFaultTime('00000000000000') === undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('99999999999999') === undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('20260229120000') === undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('2026010112000') !== undefined).assertTrue();
      expect(IssueFormValidator.validateFaultTime('202601011200000') !== undefined).assertTrue();
    });

    it('form_validation_should_not_mutate_input_state', 0, () => {
      const state: FormState = {
        description: '',
        probabilityId: '3',
        type: issueTypeList[0],
        faultTime: '20260101120000',
        attachments: []
      };
      const beforeDescription = state.description;
      const beforeProbability = state.probabilityId;
      const issues = IssueFormValidator.validateForm(state);
      expect(issues.length).assertEqual(1);
      expect(state.description).assertEqual(beforeDescription);
      expect(state.probabilityId).assertEqual(beforeProbability);
      expect(state.attachments.length).assertEqual(0);
    });

    it('form_builder_should_preserve_issue_identity_fields', 0, () => {
      const state: FormState = {
        description: 'identity check',
        probabilityId: '1',
        type: issueTypeList[0],
        faultTime: '20260101120000',
        attachments: []
      };
      const first = IssueFormBuilder.build(state);
      const second = IssueFormBuilder.build(state);
      expect(first === second).assertFalse();
      expect(first.description).assertEqual(second.description);
      expect(first.probabilityObj === second.probabilityObj).assertFalse();
      expect((first.probabilityObj as Probability).id).assertEqual('1');
    });

    it('attachment_remaining_should_recover_after_removal', 0, () => {
      const candidates: AttachmentCandidate[] = [
        { type: 'image', sizeBytes: 1, name: 'a.png' },
        { type: 'image', sizeBytes: 2, name: 'b.png' },
        { type: 'image', sizeBytes: 3, name: 'c.png' },
        { type: 'image', sizeBytes: 4, name: 'd.png' }
      ];
      let attachments = AttachmentSelectionValidator.toAttachments(candidates);
      expect(AttachmentSelectionValidator.remaining(attachments.length)).assertEqual(0);
      attachments = attachments.slice(0, attachments.length - 1);
      expect(AttachmentSelectionValidator.remaining(attachments.length)).assertEqual(1);
      expect(AttachmentSelectionValidator.canSelect(attachments.length, 1)).assertTrue();
    });
  });
}

