//
//  NetworkResult.swift
//  ServerGet-Prac
//
//  Created by 김혜수 on 2021/07/12.
//
import Foundation

// 서버통신 결과 저장

enum NetworkResult<T> {
    case success(T)     // 서버 통신 성공했을 때
    case requestErr(T)  // 요청 에러 발생했을 때
    case pathErr        // 경로 에러 발생했을 때
    case serverErr      // 서버의 내부적 에러가 발생했을 때
    case networkFail    // 네트워크 연결 실패했을 때
}
