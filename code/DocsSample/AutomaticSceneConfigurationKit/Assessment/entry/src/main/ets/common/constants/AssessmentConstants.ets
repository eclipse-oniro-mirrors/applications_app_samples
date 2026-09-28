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
 * Constants used by the assessment mode sample.
 */
export class AssessmentConstants {
  public static readonly TAG: string = '[Sample_Assessment]';
  public static readonly DOMAIN: number = 0xFF00;

  // One minute has sixty seconds and one second has one thousand milliseconds.
  public static readonly SECONDS_PER_MINUTE: number = 60;
  public static readonly MILLIS_PER_SECOND: number = 1000;
  public static readonly MILLIS_PER_MINUTE: number = 60000;

  // Candidate values of AssessmentConfig.duration. The value 0 means that the default
  // duration is used, and the default duration equals the maximum duration.
  public static readonly DURATION_DEFAULT: number = 0;
  public static readonly DURATION_TEN_MINUTES: number = 600000;
  public static readonly DURATION_THIRTY_MINUTES: number = 1800000;
  public static readonly DURATION_SIXTY_MINUTES: number = 3600000;

  // The assessment service accepts at most twenty bundle names in the whitelist,
  // and the concatenated bundle names must not exceed 2048 characters in total.
  public static readonly MAX_ALLOWED_APPS: number = 20;
  public static readonly MAX_EVENT_LOG: number = 20;
  public static readonly COUNTDOWN_INTERVAL: number = 1000;
  public static readonly DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

  // The ASCII code of the letter A, it is used to label the options of a question.
  public static readonly OPTION_LABEL_BASE: number = 65;
  // The option label and the countdown text are both padded to two characters.
  public static readonly TEXT_PAD_LENGTH: number = 2;
  public static readonly TOAST_DURATION: number = 2000;
  public static readonly INVALID_ANSWER: number = -1;
  // The queried duration is set to -1 when no assessment session is active.
  public static readonly INVALID_DURATION: number = -1;

  // Callback event types recorded in the event log.
  public static readonly EVENT_BEGIN: string = 'onBegin';
  public static readonly EVENT_INTERRUPTED: string = 'onInterrupted';
  public static readonly EVENT_END: string = 'onEnd';
  public static readonly EVENT_API_ERROR: string = 'onApiError';

  // AppStorage keys shared by the controller and the pages. The pages declare these keys
  // as string literals because the ArkUI state decorators require constant expressions,
  // the literal values must be kept the same as the constants below.
  public static readonly KEY_ACTIVE: string = 'assessmentActive';
  public static readonly KEY_DURATION: string = 'assessmentDuration';
  public static readonly KEY_LOGS: string = 'assessmentLogs';
  public static readonly KEY_EVENT_TYPE: string = 'assessmentEventType';
  public static readonly KEY_EVENT_CODE: string = 'assessmentEventCode';
  public static readonly KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
  public static readonly KEY_EVENT_SEQ: string = 'assessmentEventSeq';

  // Page routes declared in main_pages.json.
  public static readonly PAGE_EXAM: string = 'exam/pages/ExamPage';
}
