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
 * 注册表单校验结果，取值顺序与页面原有 if/else 分支顺序一致。
 */
export enum RegisterResult {
    OK = 0,
    USERNAME_EMPTY = 1,
    ACCOUNT_EXISTS = 2,
    EMAIL_INVALID = 3,
    PASSWORD_EMPTY = 4,
    PASSWORD_TOO_SHORT = 5,
    CONFIRM_MISMATCH = 6
}

/**
 * 修改表单校验结果。OK_WITHOUT_PASSWORD 表示本次未修改密码，只更新资料。
 */
export enum ModifyResult {
    OK_WITH_PASSWORD = 0,
    OK_WITHOUT_PASSWORD = 1,
    EMAIL_INVALID = 2,
    PASSWORD_TOO_SHORT = 3,
    PASSWORD_SAME_AS_OLD = 4,
    CONFIRM_MISMATCH = 5
}

/**
 * 登录校验结果。
 */
export enum LoginResult {
    OK = 0,
    NAME_EMPTY = 1,
    PASSWORD_EMPTY = 2,
    FAILED = 3
}

/**
 * 注册页输入。
 */
export interface RegisterInput {
    username: string
    email: string
    signature: string
    password: string
    confirmPassword: string
}

/**
 * 修改页输入。
 */
export interface ModifyInput {
    email: string
    signature: string
    password: string
    confirmPassword: string
}

/**
 * 登录页输入。
 */
export interface LoginInput {
    name: string
    password: string
}

/**
 * 表单校验规则，与页面展示的输入限制同源。
 */
export class AccountValidator {
    /**
     * 邮箱规则：本地部分允许字母、数字、下划线、点、减号；域名允许减号；顶级域长度 2~6。
     */
    public static readonly EMAIL_PATTERN: RegExp =
        new RegExp('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$')
    /**
     * 用户名规则：注册页输入框 inputFilter 同源，只允许字母、数字、下划线。
     */
    public static readonly USERNAME_PATTERN: RegExp = new RegExp('^[A-Za-z0-9_]+$')
    /**
     * 密码最短长度。
     */
    public static readonly MIN_PASSWORD_LENGTH: number = 6
    /**
     * 注册页用户名输入框长度上限。
     */
    public static readonly USERNAME_MAX_LENGTH: number = 15
    /**
     * 注册页、修改页其它输入框长度上限。
     */
    public static readonly FIELD_MAX_LENGTH: number = 18
    /**
     * 登录页输入框长度上限。
     */
    public static readonly LOGIN_MAX_LENGTH: number = 20

    /**
     * 邮箱格式是否合法。
     *
     * @param email 邮箱
     * @returns 合法返回 true
     */
    public static isEmailValid(email: string): boolean {
        return AccountValidator.EMAIL_PATTERN.test(email)
    }

    /**
     * 用户名是否只包含允许的字符。
     *
     * @param username 用户名
     * @returns 合法返回 true
     */
    public static isUsernameValid(username: string): boolean {
        return AccountValidator.USERNAME_PATTERN.test(username)
    }

    /**
     * 密码长度是否满足最短要求。
     *
     * @param password 密码
     * @returns 满足返回 true
     */
    public static isPasswordLongEnough(password: string): boolean {
        return password.length >= AccountValidator.MIN_PASSWORD_LENGTH
    }

    /**
     * 注册表单校验。
     *
     * @param input 注册输入
     * @param accountExists 该用户名在本应用下是否已注册
     * @returns 校验结果
     */
    public static validateRegister(input: RegisterInput, accountExists: boolean): RegisterResult {
        if (input.username === '') {
            return RegisterResult.USERNAME_EMPTY
        }
        if (accountExists) {
            return RegisterResult.ACCOUNT_EXISTS
        }
        if (input.email !== '' && !AccountValidator.isEmailValid(input.email)) {
            return RegisterResult.EMAIL_INVALID
        }
        if (input.password === '') {
            return RegisterResult.PASSWORD_EMPTY
        }
        if (input.password.length < AccountValidator.MIN_PASSWORD_LENGTH) {
            return RegisterResult.PASSWORD_TOO_SHORT
        }
        if (input.confirmPassword !== input.password) {
            return RegisterResult.CONFIRM_MISMATCH
        }
        return RegisterResult.OK
    }

    /**
     * 修改表单校验。
     *
     * @param input 修改输入
     * @param storedPassword 当前已保存的密码
     * @returns 校验结果
     */
    public static validateModify(input: ModifyInput, storedPassword: string): ModifyResult {
        if (input.email !== '' && !AccountValidator.isEmailValid(input.email)) {
            return ModifyResult.EMAIL_INVALID
        }
        if (input.password !== '' && input.password.length < AccountValidator.MIN_PASSWORD_LENGTH) {
            return ModifyResult.PASSWORD_TOO_SHORT
        }
        if (input.password !== '' && input.password === storedPassword) {
            return ModifyResult.PASSWORD_SAME_AS_OLD
        }
        if (input.confirmPassword !== input.password) {
            return ModifyResult.CONFIRM_MISMATCH
        }
        if (input.password !== '' && input.confirmPassword !== '') {
            return ModifyResult.OK_WITH_PASSWORD
        }
        return ModifyResult.OK_WITHOUT_PASSWORD
    }

    /**
     * 登录表单校验。
     *
     * @param input 登录输入
     * @param storedPassword 该用户名对应的已保存密码
     * @param loginFlag 该用户名对应的已保存登录标记
     * @returns 校验结果
     */
    public static validateLogin(input: LoginInput, storedPassword: string, loginFlag: string): LoginResult {
        if (input.name === '') {
            return LoginResult.NAME_EMPTY
        }
        if (input.password === '') {
            return LoginResult.PASSWORD_EMPTY
        }
        if (storedPassword === input.password && loginFlag === 'true') {
            return LoginResult.OK
        }
        return LoginResult.FAILED
    }
}
