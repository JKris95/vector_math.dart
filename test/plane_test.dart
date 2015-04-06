library vector_math.test.plane_test;

import 'package:unittest/unittest.dart';

import 'package:vector_math/vector_math.dart';

import 'test_utils.dart';

void testPlaneNormalize() {
  final Plane plane = new Plane.normalconstant(v3(2.0, 0.0, 0.0), 2.0);

  plane.normalize();

  expect(plane.normal.x, equals(1.0));
  expect(plane.normal.y, equals(0.0));
  expect(plane.normal.z, equals(0.0));
  expect(plane.normal.length, equals(1.0));
  expect(plane.constant, equals(1.0));
}

void testPlaneDistanceToVector3() {
  final Plane plane = new Plane.normalconstant(v3(2.0, 0.0, 0.0), -2.0);

  plane.normalize();

  expect(plane.distanceToVector3(v3(4.0, 0.0, 0.0)), equals(3.0));
  expect(plane.distanceToVector3(v3(1.0, 0.0, 0.0)), equals(0.0));
}

void testPlaneIntersection() {
  final Plane plane1 = new Plane.normalconstant(v3(1.0, 0.0, 0.0), -2.0);
  final Plane plane2 = new Plane.normalconstant(v3(0.0, 1.0, 0.0), -3.0);
  final Plane plane3 = new Plane.normalconstant(v3(0.0, 0.0, 1.0), -4.0);

  plane1.normalize();
  plane2.normalize();
  plane3.normalize();

  final point = new Vector3.zero();

  Plane.intersection(plane1, plane2, plane3, point);

  expect(point.x, equals(2.0));
  expect(point.y, equals(3.0));
  expect(point.z, equals(4.0));
}

void main() {
  test('Plane Normalize', testPlaneNormalize);
  test('Plane DistanceToVector3', testPlaneDistanceToVector3);
  test('Plane Intersection', testPlaneIntersection);
}