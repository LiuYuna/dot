package cn.isuuuu.dot.base;

import cn.isuuuu.dot.common.core.constant.PackageConstant;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(PackageConstant.DOT_MAPPER_PACKAGE)
@SpringBootApplication(scanBasePackages = PackageConstant.DOT_BASE_PACKAGE)
public class Application {

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }

}
