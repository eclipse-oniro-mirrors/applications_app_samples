/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export {}

// ===== basic_enum_declaration =====
// [Start basic_enum_declaration]
// 基本枚举声明
enum Direction {
  Up,
  Down,
  Left,
  Right
}

// 使用枚举
let dir: Direction = Direction.Up;
let moveDir: Direction = Direction.Down;

console.info(`${dir}`);   // 0
console.info(`${moveDir}`);  // 1

// 枚举比较
if (dir === Direction.Up) {
  console.info('向上移动');
}

// 枚举作为函数参数
function declarationMove(direction: Direction): void {
  switch (direction) {
    case Direction.Up:
      console.info('向上');
      break;
    case Direction.Down:
      console.info('向下');
      break;
    case Direction.Left:
      console.info('向左');
      break;
    case Direction.Right:
      console.info('向右');
      break;
  }
}

declarationMove(Direction.Up);  // 向上

// 枚举作为返回值
function getDefaultDirection(): Direction {
  return Direction.Right;
}

let defaultDir: Direction = getDefaultDirection();
// [End basic_enum_declaration]

// ===== enum_naming_conventions =====
// [Start enum_naming_conventions]
// 枚举名：PascalCase
enum UserRole {
  Admin,      // PascalCase
  Moderator,
  RegularUser
}

enum HttpStatus {
  OK,
  NotFound,
  InternalServerError
}

// 避免缩写，使用完整单词
enum Color {
  Red,        // 推荐
  Green,
  Blue
}

// 反例
enum Clr {
  R,    // 反例：缩写
  G,
  B
}

// 语义化命名
enum PaymentStatus {
  Pending,     // 待支付
  Processing,  // 处理中
  Completed,   // 已完成
  Failed,      // 失败
  Cancelled    // 已取消
}

// 使用enum作为类型
function updateStatus(status: PaymentStatus): void {
  console.info(`状态更新为: ${status}`);
}

updateStatus(PaymentStatus.Completed);
// [End enum_naming_conventions]

// ===== numeric_enum_auto_increment =====
// [Start numeric_enum_auto_increment]
// 无值枚举（默认数值枚举）
enum Size {
  Small,   // 0
  Medium,  // 1
  Large    // 2
}

let size: Size = Size.Small;
console.info(`${size}`);  // 0

// 数值枚举自动递增
enum Level {
  Low,     // 0
  Medium,  // 1
  High,    // 2
  Critical // 3
}

console.info(`${Level.Low}`);      // 0
console.info(`${Level.Medium}`);   // 1
console.info(`${Level.High}`);     // 2
console.info(`${Level.Critical}`); // 3

// 使用数值枚举
function getPriority(level: Level): number {
  let priority: number;
  switch (level) {
    case Level.Low:
      priority = 1;
      break;
    case Level.Medium:
      priority = 5;
      break;
    case Level.High:
      priority = 10;
      break;
    case Level.Critical:
      priority = 100;
      break;
    default:
      priority = 0;
  }
  return priority;
}

getPriority(Level.High);  // 10
// [End numeric_enum_auto_increment]

// ===== simulated_associated_values =====
// [Start simulated_associated_values]
// TypeScript不支持关联值枚举
// ArkTS中使用接口联合模拟不同结果形态

interface SuccessResult {
  success: true;
  value: number;
}

interface FailureResult {
  success: false;
  error: string;
}

type Result = SuccessResult | FailureResult;

let successResult: Result = { success: true, value: 42 };
let failureResult: Result = { success: false, error: 'Failed' };

function processResult(result: Result): void {
  if (result.success) {
    console.info(`成功，值: ${result.value}`);
  } else {
    console.info(`失败，错误: ${(result as FailureResult).error}`);
  }
}

processResult(successResult);
processResult(failureResult);

// 也可以使用更明确的判别字段
interface OperationSuccessResult {
  type: 'success';
  value: number;
}

interface OperationFailureResult {
  type: 'failure';
  error: string;
}

type OperationResult = OperationSuccessResult | OperationFailureResult;

let success: OperationResult = { type: 'success', value: 100 };
let failure: OperationResult = { type: 'failure', error: 'Error' };
// [End simulated_associated_values]

// ===== discriminated_union_message_types =====
// [Start discriminated_union_message_types]
// 不同类型的关联值
interface TextMessage {
  kind: 'text';
  content: string;
}

interface ImageMessage {
  kind: 'image';
  url: string;
  imageWidth: number;
  imageHeight: number;
}

interface VideoMessage {
  kind: 'video';
  url: string;
  duration: number;
}

type Message = TextMessage | ImageMessage | VideoMessage;

let textMessage: Message = { 
  kind: 'text', 
  content: 'Hello' 
};

let imageMessage: Message = { 
  kind: 'image', 
  url: 'EXAMPLE_IMAGE_URL',
  imageWidth: 800,
  imageHeight: 600
};

let videoMessage: Message = { 
  kind: 'video', 
  url: 'EXAMPLE_VIDEO_URL',
  duration: 120
};

// 处理不同类型消息
function handleMessage(message: Message): void {
  switch (message.kind) {
    case 'text':
      console.info(`文本: ${message.content}`);
      break;
    case 'image':
      console.info(`图片: ${message.url} (${message.imageWidth}x${message.imageHeight})`);
      break;
    case 'video':
      console.info(`视频: ${message.url} (${message.duration}s)`);
      break;
  }
}

handleMessage(textMessage);
handleMessage(imageMessage);
// [End discriminated_union_message_types]

// ===== extract_associated_values =====
// [Start extract_associated_values]
// TypeScript支持：let { value } = result;
// ArkTS需要单独提取

interface ExtractSuccessResult {
  success: true;
  value: number;
}

interface ExtractFailureResult {
  success: false;
  error: string;
}

type ExtractResult = ExtractSuccessResult | ExtractFailureResult;

function getValue(result: ExtractResult): number | undefined {
  if (result.success) {
    return result.value;  // 直接访问
  }
  return undefined;
}

function getError(result: ExtractResult): string | undefined {
  if (result.success === false) {
    return (result as ExtractFailureResult).error;  // 直接访问
  }
  return undefined;
}

let result: ExtractResult = { success: true, value: 42 };

let value: number | undefined = getValue(result);
if (value !== undefined) {
  console.info(`${value.toString()}`);
}
// [End extract_associated_values]

// ===== shape_area_calculation =====
// [Start shape_area_calculation]
interface DocCircleShape {
  kind: 'circle';
  radius: number;
}

interface DocRectangleShape {
  kind: 'rectangle';
  rectWidth: number;
  rectHeight: number;
}

interface DocTriangleShape {
  kind: 'triangle';
  base: number;
  height: number;
}

type DocShape = DocCircleShape | DocRectangleShape | DocTriangleShape;

function calculateArea(shape: DocShape): number {
  switch (shape.kind) {
    case 'circle':
      return Math.PI * shape.radius * shape.radius;
    case 'rectangle':
      return shape.rectWidth * shape.rectHeight;
    case 'triangle':
      return 0.5 * shape.base * shape.height;
    default:
      return 0;
  }
}

let circle: DocShape = { kind: 'circle', radius: 5 };
let rectangle: DocShape = { kind: 'rectangle', rectWidth: 10, rectHeight: 20 };
let triangle: DocShape = { kind: 'triangle', base: 8, height: 6 };

console.info(`${calculateArea(circle)}`);      // ~78.54
console.info(`${calculateArea(rectangle)}`);    // 200
console.info(`${calculateArea(triangle)}`);     // 24
// [End shape_area_calculation]

// ===== parse_enum_from_value =====
// [Start parse_enum_from_value]
// 从字符串创建枚举值
function parseStatus(statusStr: string): Status | undefined {
  switch (statusStr) {
    case 'pending':
      return Status.Pending;
    case 'active':
      return Status.Active;
    case 'completed':
      return Status.Completed;
    case 'failed':
      return Status.Failed;
    default:
      return undefined;
  }
}

enum Status {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed',
  Failed = 'failed'
}

let parsed: Status | undefined = parseStatus('active');
if (parsed !== undefined) {
  console.info(`${parsed}`);  // active
}

// 从数值创建枚举值
function getPriorityByValue(value: number): Priority | undefined {
  switch (value) {
    case 1:
      return Priority.Low;
    case 2:
      return Priority.Medium;
    case 3:
      return Priority.High;
    case 10:
      return Priority.Critical;
    default:
      return undefined;
  }
}

enum Priority {
  Low = 1,
  Medium = 2,
  High = 3,
  Critical = 10
}

let priority: Priority | undefined = getPriorityByValue(3);
if (priority !== undefined) {
  console.info(`${priority.toString()}`);
}
// [End parse_enum_from_value]

// ===== iterate_enum_values =====
// [Start iterate_enum_values]
// 手动创建枚举值数组
enum ValsDirection {
  Up,
  Down,
  Left,
  Right
}

function getDirectionValues(): ValsDirection[] {
  return [ValsDirection.Up, ValsDirection.Down, ValsDirection.Left, ValsDirection.Right];
}

function getDirectionNames(): string[] {
  return ['Up', 'Down', 'Left', 'Right'];
}

// 遍历所有枚举值
for (let dir of getDirectionValues()) {
  console.info(`${dir.toString()}`);
}

// 遍历字符串枚举
enum ValsStatus {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed'
}

function getStatusValues(): ValsStatus[] {
  return [ValsStatus.Pending, ValsStatus.Active, ValsStatus.Completed];
}

for (let status of getStatusValues()) {
  console.info(`${status}`);
}
// [End iterate_enum_values]

// ===== enum_value_validation =====
// [Start enum_value_validation]
// 使用常量数组
enum LogLevel {
  Debug,
  Info,
  Warning,
  Error
}

const ALL_LOG_LEVELS: LogLevel[] = [
  LogLevel.Debug,
  LogLevel.Info,
  LogLevel.Warning,
  LogLevel.Error
];

// 获取枚举数量
function getEnumCount(): number {
  return ALL_LOG_LEVELS.length;
}

// 检查是否为有效枚举值
function isValidLogLevel(level: number): boolean {
  for (let validLevel of ALL_LOG_LEVELS) {
    if (validLevel === level) {
      return true;
    }
  }
  return false;
}

isValidLogLevel(LogLevel.Info);   // true
isValidLogLevel(99);              // false

// 枚举值范围检查
function isLogLevelInRange(level: LogLevel): boolean {
  return level >= LogLevel.Debug && level <= LogLevel.Error;
}

isLogLevelInRange(LogLevel.Warning);  // true
// [End enum_value_validation]

// ===== enum_helper_class =====
// [Start enum_helper_class]
enum HelperColor {
  Red,
  Green,
  Blue
}

class ColorHelper {
  static getName(color: HelperColor): string {
    switch (color) {
      case HelperColor.Red:
        return '红色';
      case HelperColor.Green:
        return '绿色';
      case HelperColor.Blue:
        return '蓝色';
      default:
        return '未知';
    }
  }

  static getHex(color: HelperColor): string {
    switch (color) {
      case HelperColor.Red:
        return '#FF0000';
      case HelperColor.Green:
        return '#00FF00';
      case HelperColor.Blue:
        return '#0000FF';
      default:
        return '#000000';
    }
  }
}

let red: HelperColor = HelperColor.Red;
let name: string = ColorHelper.getName(red);
let hex: string = ColorHelper.getHex(red);
// [End enum_helper_class]

// ===== complex_enum_values =====
// [Start complex_enum_values]
interface PriorityInfo {
  value: number;
  label: string;
  weight: number;
}

class PriorityLevel {
  public static readonly LOW: PriorityInfo = { value: 1, label: '低', weight: 10 };
  public static readonly MEDIUM: PriorityInfo = { value: 2, label: '中', weight: 50 };
  public static readonly HIGH: PriorityInfo = { value: 3, label: '高', weight: 100 };

  static getAll(): PriorityInfo[] {
    return [
      PriorityLevel.LOW,
      PriorityLevel.MEDIUM,
      PriorityLevel.HIGH
    ];
  }
}

let allPriorities: PriorityInfo[] = PriorityLevel.getAll();
// [End complex_enum_values]

// ===== state_machine_and_error_code =====
// [Start state_machine_and_error_code]
enum State {
  Idle,
  Running,
  Paused,
  Stopped
}

class StateMachine {
  static canTransition(from: State, to: State): boolean {
    switch (from) {
      case State.Idle:
        return to === State.Running;
      case State.Running:
        return to === State.Paused || to === State.Stopped;
      case State.Paused:
        return to === State.Running || to === State.Stopped;
      case State.Stopped:
        return to === State.Idle;
      default:
        return false;
    }
  }

  static transition(from: State, to: State): State {
    if (StateMachine.canTransition(from, to)) {
      return to;
    }
    return from;
  }
}

let newState: State = StateMachine.transition(State.Idle, State.Running);
console.info(`${newState}`);

enum ErrorCode {
  Unknown = 0,
  InvalidInput = 100,
  NotFound = 404,
  Unauthorized = 401,
  ServerError = 500
}

class ErrorCodeHelper {
  static getMessage(code: ErrorCode): string {
    switch (code) {
      case ErrorCode.Unknown:
        return '未知错误';
      case ErrorCode.InvalidInput:
        return '输入无效';
      case ErrorCode.NotFound:
        return '资源未找到';
      case ErrorCode.Unauthorized:
        return '未授权访问';
      case ErrorCode.ServerError:
        return '服务器错误';
      default:
        return '错误';
    }
  }

  static isServerError(code: ErrorCode): boolean {
    return code >= 500;
  }

  static isClientError(code: ErrorCode): boolean {
    return code >= 400 && code < 500;
  }
}

let message: string = ErrorCodeHelper.getMessage(ErrorCode.NotFound);
let isServer: boolean = ErrorCodeHelper.isServerError(ErrorCode.ServerError);
// [End state_machine_and_error_code]

// ===== replace_magic_strings_numbers =====
// [Start replace_magic_strings_numbers]
// 反例：使用魔术字符串
function getStatusLabel(status: string): string {
  if (status === 'pending') {
    return '待处理';
  } else if (status === 'active') {
    return '激活';
  } else if (status === 'completed') {
    return '已完成';
  }
  return '未知';
}

// 推荐：使用枚举
function getStatusLabelEnum(status: NumsStatus): string {
  switch (status) {
    case NumsStatus.Pending:
      return '待处理';
    case NumsStatus.Active:
      return '激活';
    case NumsStatus.Completed:
      return '已完成';
    default:
      return '未知';
  }
}

enum NumsStatus {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed'
}

// 反例：使用魔术数值
function getErrorCode(code: number): string {
  if (code === 404) {
    return 'Not Found';
  } else if (code === 401) {
    return 'Unauthorized';
  }
  return 'Unknown';
}

// 推荐：使用枚举
function getErrorCodeEnum(code: NumsErrorCode): string {
  switch (code) {
    case NumsErrorCode.NotFound:
      return 'Not Found';
    case NumsErrorCode.Unauthorized:
      return 'Unauthorized';
    default:
      return 'Unknown';
  }
}

enum NumsErrorCode {
  NotFound = 404,
  Unauthorized = 401
}

// 枚举替代常量
// 反例
const STATUS_PENDING = 'pending';
const STATUS_ACTIVE = 'active';
const STATUS_COMPLETED = 'completed';

// 推荐
enum OrderStatus {
  Pending = 'pending',
  Active = 'active',
  Completed = 'completed'
}
// [End replace_magic_strings_numbers]

// ===== choose_enum_type =====
// [Start choose_enum_type]
// 数值枚举：用于数值相关场景
enum ChooseErrorCode {
  Unknown = 0,
  InvalidInput = 100,
  NotFound = 404
}

// 字符串枚举：用于字符串标识场景
enum ChooseUserRole {
  Admin = 'admin',
  User = 'user',
  Guest = 'guest'
}

// 数值枚举自动递增：用于顺序无关的场景
enum ChooseLogLevel {
  Debug,  // 0
  Info,   // 1
  Warn,   // 2
  Error   // 3
}
// [End choose_enum_type]

// ===== semantic_enum_naming =====
// [Start semantic_enum_naming]
// 推荐：语义清晰
enum NamingPaymentStatus {
  PendingPayment,
  PaymentProcessing,
  PaymentCompleted,
  PaymentFailed
}

// 反例：含义模糊
enum NamingStatus {
  P,
  PP,
  PC,
  PF
}
// [End semantic_enum_naming]

// ===== unique_enum_values =====
// [Start unique_enum_values]
// 确保枚举值唯一
enum ValsPriority {
  Low = 1,
  Medium = 2,
  High = 3
}

// 反例：值重复
enum InvalidPriority {
  Low = 1,
  Medium = 1,  // 与Low相同
  High = 2
}
// [End unique_enum_values]

// ===== organize_constants_with_enum =====
// [Start organize_constants_with_enum]
// 推荐：使用枚举
enum ApiEndpoint {
  Users = '/api/users',
  Products = '/api/products',
  Orders = '/api/orders'
}

function getEndpoint(endpoint: ApiEndpoint): string {
  return endpoint;
}

// 反例：分散的常量
const API_USERS = '/api/users';
const API_PRODUCTS = '/api/products';
const API_ORDERS = '/api/orders';
// [End organize_constants_with_enum]

// ===== encapsulate_enum_logic =====
// [Start encapsulate_enum_logic]
// 推荐：使用静态辅助类封装枚举相关逻辑
enum LogicDirection {
  Up,
  Down,
  Left,
  Right
}

class DirectionHelper {
  static getOpposite(dir: LogicDirection): LogicDirection {
    switch (dir) {
      case LogicDirection.Up:
        return LogicDirection.Down;
      case LogicDirection.Down:
        return LogicDirection.Up;
      case LogicDirection.Left:
        return LogicDirection.Right;
      case LogicDirection.Right:
        return LogicDirection.Left;
    }
  }
}

let opposite: LogicDirection = DirectionHelper.getOpposite(LogicDirection.Up);
// [End encapsulate_enum_logic]

// ===== switch_handle_enum_actions =====
// [Start switch_handle_enum_actions]
enum Action {
  Create,
  Update,
  Delete,
  Read
}

function executeAction(action: Action): void {
  switch (action) {
    case Action.Create:
      createResource();
      break;
    case Action.Update:
      updateResource();
      break;
    case Action.Delete:
      deleteResource();
      break;
    case Action.Read:
      readResource();
      break;
    default:
      // 处理未知情况
      console.info('Unknown action');
  }
}

function createResource(): void { console.info('创建'); }
function updateResource(): void { console.info('更新'); }
function deleteResource(): void { console.info('删除'); }
function readResource(): void { console.info('读取'); }
// [End switch_handle_enum_actions]

// [Start union_enum_member_type]
enum ShapeKind {
  Circle,
  Square
}

interface UeCircle {
  kind: ShapeKind.Circle;  // 仅接受Circle成员
  radius: number;
}

interface UeSquare {
  kind: ShapeKind.Square;  // 仅接受Square成员
  sideLength: number;
}

let ueCircle: UeCircle = { kind: ShapeKind.Circle, radius: 10 };
console.info(`${ueCircle.radius.toString()}`);  // 10
// [End union_enum_member_type]

// [Start const_enum_alternative]
enum CeDirection {
  Up = 0,
  Down = 1
}

let ceD: CeDirection = CeDirection.Up;
console.info(`${ceD}`);  // 0
// [End const_enum_alternative]

// [Start enum_keyof_alternative]
enum EkLogLevel {
  ERROR,
  WARN,
  INFO,
  DEBUG
}

const ekLogLevelKeys: string[] = ['ERROR', 'WARN', 'INFO', 'DEBUG'];

function ekPrintImportant(key: string, message: string): void {
  let num: number = EkLogLevel[key];
  if (num <= EkLogLevel.WARN) {
    console.info(`[${key}] ${message}`);
  }
}

ekPrintImportant('ERROR', 'System error');
// [End enum_keyof_alternative]

// [Start object_vs_enum_alternative]
enum OvDirection {
  Up = 0,
  Down = 1,
  Left = 2,
  Right = 3
}

function ovRun(dir: OvDirection): void {
  console.info(`Running ${dir}`);
}

ovRun(OvDirection.Right);  // Running 3
// [End object_vs_enum_alternative]

// ===== enum_auto_increment_rules =====
// [Start enum_auto_increment_rules]
// 数值枚举自动递增
enum AutoNumberEnum {
  First,    // 0（自动）
  Second,   // 1（自动）
  Third,    // 2（自动）
  Custom = 10,
  Fourth,   // 11（从Custom继续）
  Fifth     // 12
}

console.info(`${AutoNumberEnum.First}`);    // 0
console.info(`${AutoNumberEnum.Second}`);   // 1
console.info(`${AutoNumberEnum.Third}`);    // 2
console.info(`${AutoNumberEnum.Custom}`);   // 10
console.info(`${AutoNumberEnum.Fourth}`);   // 11
console.info(`${AutoNumberEnum.Fifth}`);    // 12

// 字符串枚举必须显式赋值
enum AutoStringEnum {
  A = 'A',
  B = 'B',
  C = 'C'
}
// [End enum_auto_increment_rules]

// ===== enum_bidirectional_mapping =====
// [Start enum_bidirectional_mapping]
// 数值枚举支持双向映射
enum BiNumberEnum {
  Zero,
  One,
  Two
}

let biEnumName: string = BiNumberEnum[0];   // 'Zero'
let biValue: number = BiNumberEnum.One;     // 1

console.info(`${biEnumName}`);   // Zero
console.info(`${biValue}`);      // 1

// 字符串枚举不支持反向映射
enum BiStringEnum {
  A = 'A',
  B = 'B'
}

let biA: BiStringEnum = BiStringEnum.A;  // 'A'

// 双向映射示例
enum BiUserRole {
  Admin = 100,
  Moderator = 200,
  User = 300
}

let biRole: BiUserRole = BiUserRole.Admin;     // 100
let biRoleName: string = BiUserRole[100];      // 'Admin'

function getBiRoleName(roleId: number): string | undefined {
  return BiUserRole[roleId];
}

console.info(`${getBiRoleName(100)}`);  // Admin
console.info(`${getBiRoleName(200)}`);  // Moderator
// [End enum_bidirectional_mapping]

// ===== enum_member_list =====
// [Start enum_member_list]
enum ListNumberEnum {
  First,
  Second,
  Third
}

interface ListEnumMember {
  name: string;
  value: number;
}

function getAllEnumMembers(): ListEnumMember[] {
  return [
    { name: 'First', value: ListNumberEnum.First },
    { name: 'Second', value: ListNumberEnum.Second },
    { name: 'Third', value: ListNumberEnum.Third }
  ];
}

let elmMembers: ListEnumMember[] = getAllEnumMembers();
for (let member of elmMembers) {
  console.info(`${member.name}: ${member.value}`);
}

// 手动定义枚举成员列表
enum ListColorEnum {
  Red,
  Green,
  Blue
}

const LIST_COLOR_VALUES: ListColorEnum[] = [ListColorEnum.Red, ListColorEnum.Green, ListColorEnum.Blue];
const LIST_COLOR_NAMES: string[] = ['Red', 'Green', 'Blue'];

for (let i = 0; i < LIST_COLOR_VALUES.length; i++) {
  console.info(`${LIST_COLOR_NAMES[i]}: ${LIST_COLOR_VALUES[i]}`);
}
// [End enum_member_list]

// ===== namespace_extension =====
// [Start namespace_extension]
enum NsColor {
  Red,
  Green,
  Blue
}

namespace NsColor {
  export function getName(color: NsColor): string {
    switch (color) {
      case NsColor.Red:
        return '红色';
      case NsColor.Green:
        return '绿色';
      case NsColor.Blue:
        return '蓝色';
      default:
        return '未知';
    }
  }
}

let nsName: string = NsColor.getName(NsColor.Red);
console.info(`${nsName}`); // 红色
// [End namespace_extension]

// ===== const_enum_usage =====
// [Start const_enum_usage]
const enum CeConstDirection {
  Up,
  Down
}

let cedDir: CeConstDirection = CeConstDirection.Up;
console.info(`${cedDir}`); // 0
// [End const_enum_usage]

// ===== split_heterogeneous_enum =====
// [Start split_heterogeneous_enum]
enum HeNumericResult {
  No = 0,
  Yes = 1
}

enum HeStringResult {
  No = 'NO',
  Yes = 'YES'
}
// [End split_heterogeneous_enum]

// ===== constant_enum_members =====
// [Start constant_enum_members]
enum ConstExampleEnum {
  A,        // 常量：0
  B = 1,    // 常量：字面量
  C = ConstExampleEnum.A + ConstExampleEnum.B // 常量：常量表达式
}
// [End constant_enum_members]

// ===== ambient_enum =====
// [Start ambient_enum]
declare enum AmbientExternalEnum {
  A = 1,
  B,
  C
}

let ambValue: AmbientExternalEnum = AmbientExternalEnum.A;
console.info(`${ambValue}`); // 1
// [End ambient_enum]
