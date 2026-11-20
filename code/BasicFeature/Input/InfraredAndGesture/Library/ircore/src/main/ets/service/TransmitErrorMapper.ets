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

import { BusinessError } from '@kit.BasicServicesKit';
import { AppLogger, StringResources } from 'common';
import { TransmitResultCode } from '../model/IrTypes';

/** BusinessError code reported when a permission is not granted. */
const ERR_CODE_PERMISSION_DENIED: number = 201;
/** BusinessError code reported for invalid parameters. */
const ERR_CODE_INVALID_PARAM: number = 401;
const SCOPE: string = 'TransmitErrorMapper';

/**
 * Maps system BusinessError codes and TransmitResultCode values to user readable
 * text. All texts come from StringResources so wording stays centralized.
 */
export class TransmitErrorMapper {
  /** Maps a system BusinessError to the normalized transmit result code. */
  static fromError(error: BusinessError): TransmitResultCode {
    AppLogger.info(SCOPE, `fromError enter: bizErrorCode=${error.code}`);
    switch (error.code) {
      case ERR_CODE_PERMISSION_DENIED:
        return TransmitResultCode.PERM_DENIED;
      case ERR_CODE_INVALID_PARAM:
        return TransmitResultCode.PARAM_ERROR;
      default:
        return TransmitResultCode.UNKNOWN;
    }
  }

  /** Returns the localized user readable text for one result code. */
  static toUserText(code: TransmitResultCode): string {
    AppLogger.info(SCOPE, `toUserText enter: code=${code}`);
    switch (code) {
      case TransmitResultCode.OK:
        return StringResources.get($r('app.string.transmit_ok'));
      case TransmitResultCode.PERM_DENIED:
        return StringResources.get($r('app.string.transmit_no_permission'));
      case TransmitResultCode.PARAM_ERROR:
        return StringResources.get($r('app.string.transmit_param_error'));
      case TransmitResultCode.NO_EMITTER:
        return StringResources.get($r('app.string.transmit_no_emitter'));
      case TransmitResultCode.BUSY:
        return StringResources.get($r('app.string.transmit_busy'));
      default:
        return StringResources.get($r('app.string.transmit_failed'));
    }
  }
}
