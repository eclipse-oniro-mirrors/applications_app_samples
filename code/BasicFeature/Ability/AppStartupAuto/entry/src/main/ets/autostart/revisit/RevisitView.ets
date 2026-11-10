import { QueryRecord } from '../AutoStartupTypes';
import { RevisitSession } from './RevisitTracker';
import { dateTimeText } from '../tools/DiagnosticTools';

function sample(record: QueryRecord | undefined): string {
  return record === undefined ? '无' : `query #${record.id}｜${record.source}｜${record.outcome}｜${record.result}｜${dateTimeText(record.timestamp)}`;
}

/** Local terminal facts, never inferred system-setting visits or boot-start evidence. */
export function revisitDetails(session: RevisitSession | undefined): string[] {
  if (session === undefined) { return ['尚无选定的终止回访']; }
  const lines: string[] = [
    `session ${session.sessionId}｜${session.stage}｜指引版本 ${session.guidanceRevision}`,
    `创建 ${dateTimeText(session.createdAt)}｜后台 ${dateTimeText(session.leftAt)}｜前台 ${dateTimeText(session.returnedAt)}`,
    `终止/最后回查 ${dateTimeText(session.recheckedAt)}｜取消 ${session.cancelled}`,
    `离开前 ${sample(session.before)}`, `返回后 ${sample(session.after)}`, session.conclusion,
    '这些事实只证明应用前后台和查询结果，不证明用户进入设置、修改开关或实际开机拉起。'
  ];
  session.attempts.forEach((record: QueryRecord): void => {
    lines.push(`回查尝试 ${sample(record)}｜错误码 ${record.errorCode || '无'}｜${record.durationMillis} ms`);
  });
  return lines;
}
