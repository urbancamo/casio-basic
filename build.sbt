ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.13.9"

libraryDependencies += "com.lihaoyi" %% "fastparse" % "2.3.3"
libraryDependencies += "org.scalactic" %% "scalactic" % "3.2.14"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.14" % "test"
libraryDependencies += "commons-io" % "commons-io" % "2.11.0"

lazy val root = (project in file("."))
  .settings(
    name := "casio-basic"
  )
