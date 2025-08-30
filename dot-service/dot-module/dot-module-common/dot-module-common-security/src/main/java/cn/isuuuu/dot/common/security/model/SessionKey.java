package cn.isuuuu.dot.common.security.model;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import lombok.AllArgsConstructor;

@AllArgsConstructor
public class SessionKey<T> {

  private String key;

  private Class<T> type;

  private final SaSession session = StpUtil.getSession(true);

  public static <T> SessionKey<T> create(String key, Class<T> type) {
    return new SessionKey<>(key, type);
  }

  public T get() {
    return session.getModel(this.key, this.type);
  }

  public void set(T value) {
    session.set(this.key, value);
  }

  public void del() {
    session.delete(this.key);
  }

}
