/**
 * SWT2DWT :: https://github.com/ZHANITEST/SWT2DWT
 *  SWT Java 코드를 DWT Dlang으로 변경해주는 매우매우 단순한 코드
 *  
 *  [빌드방법] : dmd swt2dwt.d
 *  [사용방법] : swt2dwt <소스디렉토리명>
 *
 *  2020 ZHANITEST, (c)opyleft by GPL-v3
 */
import std.stdio;
import std.file;
import std.algorithm;
import std.string;
import std.algorithm.iteration:map;

const string VERSION = "1.0.0";

int main(string[] args){
    // 변경 안할 소스파일명
    string[] doNotChange = ["app.d"];

    writeln("<< SWT to DWT Converter >>");
    if(args.length==1){
        writeln("No args and exit by 0.");
        return 0;
    }

    // 파라메터가 있음 && 디렉토리 인 경우 ...
    if(exists(args[1]) && isDir(args[1])){
        writeln(args[1], " is Directory, Let's change it!");
        writeln("a list of will not change : ", doNotChange);
        writeln("----------------------------------------");
        string[] glob; // doNotChange를 제외한 파일명
        foreach(d; map!(x => replace(x, args[1]~"\\", "")) // map을 이용해 'basePath\\'를 replace
                        (dirEntries(args[1], SpanMode.depth))){
            if(countUntil(doNotChange, d)<0){
                string g = args[1]~"\\"~d;
                glob ~= g;
                File f = File(g, "r");
                
                string srcBody;
                copy(g, "./backup_"~d); // 백업 카피
                writef("Copied %s to %s\n", g, "./backup_"~d);
                
                while(!f.eof()){
                    srcBody ~= f.readln();
                }
                f.close();

                // 단순변환 시작
                srcBody = replace(srcBody, "String", "string");
                srcBody = replace(srcBody, "package", "module");
                
                f = File(g, "w");
                f.write(srcBody);
                f.close();
                
                writef("%s was Changed!\n", g);
            }
        }
        writeln("----------------------------------------");
        writeln("Changed : ", glob);
        writeln("Done and exit by zer0.");
    }
    else if(args[1] == "--version"){
        writef("VERSION:%s, LICENSE:GPL-v3\nSimple and dirty, SWT java code to DWT dlang code converter.", VERSION);
    }
    else{
        writeln("Unkwon options and exit by 0.");
    }
    return 0;
}