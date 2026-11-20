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
 * appAccount 抛出的业务错误码，取值与 SDK 的 @ohos.account.appAccount 文档一致。
 */
export enum AccountServiceError {
    UNKNOWN = 0,
    SYSTEM_SERVICE_EXCEPTION = 12300001,
    INVALID_PARAM = 12300002,
    ACCOUNT_NOT_FOUND = 12300003,
    ACCOUNT_ALREADY_EXISTS = 12300004,
    ACCOUNT_NUMBER_REACHES_LIMIT = 12300007
}

/**
 * 部分设备版本上 AppAccount 服务直接透出内部错误码，这里登记已观测到的取值。
 */
const DEVICE_ACCOUNT_NOT_FOUND: number = 10002
const DEVICE_ACCOUNT_ALREADY_EXISTS: number = 10004

/**
 * appAccount 业务错误码的判定与描述。
 */
export class AccountErrorCode {
    /**
     * 把原始错误码映射为枚举，未文档化的错误码归入 UNKNOWN。
     *
     * @param code 原始错误码
     * @returns 错误码枚举
     */
    public static of(code: number): AccountServiceError {
        switch (code) {
            case AccountServiceError.SYSTEM_SERVICE_EXCEPTION:
                return AccountServiceError.SYSTEM_SERVICE_EXCEPTION
            case AccountServiceError.INVALID_PARAM:
                return AccountServiceError.INVALID_PARAM
            case AccountServiceError.ACCOUNT_NOT_FOUND:
                return AccountServiceError.ACCOUNT_NOT_FOUND
            case AccountServiceError.ACCOUNT_ALREADY_EXISTS:
                return AccountServiceError.ACCOUNT_ALREADY_EXISTS
            case AccountServiceError.ACCOUNT_NUMBER_REACHES_LIMIT:
                return AccountServiceError.ACCOUNT_NUMBER_REACHES_LIMIT
            case DEVICE_ACCOUNT_NOT_FOUND:
                return AccountServiceError.ACCOUNT_NOT_FOUND
            case DEVICE_ACCOUNT_ALREADY_EXISTS:
                return AccountServiceError.ACCOUNT_ALREADY_EXISTS
            default:
                return AccountServiceError.UNKNOWN
        }
    }

    /**
     * 是否表示应用账号已存在。
     *
     * @param code 原始错误码
     * @returns 已存在返回 true
     */
    public static isAccountAlreadyExists(code: number): boolean {
        return AccountErrorCode.of(code) === AccountServiceError.ACCOUNT_ALREADY_EXISTS
    }

    /**
     * 是否表示应用账号不存在。
     *
     * @param code 原始错误码
     * @returns 不存在返回 true
     */
    public static isAccountNotFound(code: number): boolean {
        return AccountErrorCode.of(code) === AccountServiceError.ACCOUNT_NOT_FOUND
    }

    /**
     * 是否属于换一个输入即可重试的错误，即参数非法、账号已存在、账号不存在。
     *
     * @param code 原始错误码
     * @returns 可重试返回 true
     */
    public static isRecoverable(code: number): boolean {
        let error: AccountServiceError = AccountErrorCode.of(code)
        return error === AccountServiceError.INVALID_PARAM ||
            error === AccountServiceError.ACCOUNT_ALREADY_EXISTS ||
            error === AccountServiceError.ACCOUNT_NOT_FOUND
    }

    /**
     * 错误码的英文描述，用于日志。
     *
     * @param code 原始错误码
     * @returns 描述文本
     */
    public static describe(code: number): string {
        switch (AccountErrorCode.of(code)) {
            case AccountServiceError.SYSTEM_SERVICE_EXCEPTION:
                return 'system service exception'
            case AccountServiceError.INVALID_PARAM:
                return 'invalid name, key or value'
            case AccountServiceError.ACCOUNT_NOT_FOUND:
                return 'account not found'
            case AccountServiceError.ACCOUNT_ALREADY_EXISTS:
                return 'account already exists'
            case AccountServiceError.ACCOUNT_NUMBER_REACHES_LIMIT:
                return 'the number of accounts reaches the upper limit'
            default:
                return `unexpected account error, code is ${code}`
        }
    }
}
